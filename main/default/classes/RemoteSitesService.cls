// BSD 3-Clause License
//
// Copyright (c) 2018, metacursion
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice, this
//   list of conditions and the following disclaimer.
//
// * Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// * Neither the name of the copyright holder nor the names of its
//   contributors may be used to endorse or promote products derived from
//   this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

public class RemoteSitesService {
    final static String endpoint = '/services/data/';
    final static String apiVersion = 'v43.0';
    final static String query = '/tooling/query?q=';
    final static String param = 'SELECT Description, EndpointUrl, FullName, IsActive, ManageableState, NamespacePrefix, ProtocolMismatch, SiteName, Metadata FROM RemoteProxy';
    final static String sobjectApi = '/tooling/sobjects/RemoteProxy/';
    @AuraEnabled public static Object Query(){
        HttpClientProviderSelf self = new HttpClientProviderSelf();
        return new HttpClientAura(self)
                .get(self.getBaseUrl() + endpoint + apiVersion + query + EncodingUtil.urlEncode(param, 'UTF-8'));
    }
    @AuraEnabled public static Object Create(String payload){
        HttpClientProviderSelf self = new HttpClientProviderSelf();
        return new HttpClientAura(self)
                .post(self.getBaseUrl() + endpoint + apiVersion + sobjectApi, payload);
    }
}
