From: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 01/16] clk: samsung: add common clock framework helper
 functions for Samsung platforms
Date: Sun, 03 Mar 2013 12:17:29 +0100
Message-ID: <51333149.1060105@gmail.com>
References: <1361175686-19400-1-git-send-email-thomas.abraham@linaro.org>
 <1361175686-19400-2-git-send-email-thomas.abraham@linaro.org>
 <201303030208.49722.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201303030208.49722.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

SGksCgpPbiAwMy8wMy8yMDEzIDAyOjA4IEFNLCBIZWlrbyBTdMO8Ym5lciB3cm90ZToKPiBCdXQg
aXMgdGhlcmUgYW4gZWFzeSB3YXkgdG8gZGVmaW5lIG1vcmUgdGhhbiBvbmUgYWxpYXM/IE9uIHRo
ZSBzM2MyNDE2IGZvcgo+IGV4YW1wbGUgdGhlIGhzbW1jIGhjbGsgaXMgdGhlICJoc21tYyIgaW8t
Y2xvY2ssIGFzIHdlbGwgYXMgdGhlIHNvdXJjZSBmb3IgdGhlCj4gIm1tY19idXNjbGsuMCIuIFNh
bWUgZm9yIHRoZSAidWFydCIgcGNsaywgdGhhdCBpcyBhbHNvIGEgYmF1ZCBjbG9jayBzb3VyY2Uu
CgpUaGlzIGRyaXZlciBjdXJyZW50bHkgcHJvdmlkZXMgZm9yIG9ubHkgb25lIGFkZGl0aW9uYWwg
Y2xrZGV2IGxvb2t1cCBlbnRyeQpwZXIgYSBwbGF0Zm9ybSBjbG9jay4gSSBwb2ludGVkIG91dCB0
aGlzIGRlc2luZyBpc3N1ZSBpbiB0aGUgZWFybHkgdmVyc2lvbgpvZiB0aGUgcGF0Y2ggc2V0LiBJ
dCdzIGJlY2F1c2UgYSBtYWNoaW5lIGNsb2NrIGRlZmluaXRpb24gaXMgY291cGxlZCB3aXRoCmEg
Y2xvY2sgY29uc3VtZXIgZGVmaW5pdGlvbi4gQW5kIElNTyB2YXJpb3VzIHNhbXN1bmdfY2xvY2tf
cmVnaXN0ZXJfKgpmdW5jdGlvbnMgc2hvdWxkIG5vdCBoYXZlIGNsa19yZWdpc3Rlcl9jbGtkZXYo
KSBpbnNpZGUgdGhlbS4gSS5lLiBmaXJzdApzdGVwIGNvdWxkIGJlIHJlZ2lzdGVyaW5nIGFsbCBt
YWNoaW5lIGNsb2NrcyBhbmQgaW4gdGhlIHNlY29uZCBvbmUgY2xrZGV2Cmxvb2t1cCBlbnRyaWVz
IGNvdWxkIGJlIGNyZWF0ZWQuIFRoaXMgaXMgaG93IG1vc3QgKGFsbD8pIGV4aXN0aW5nIFNvQwpj
bG9jayBkcml2ZXJzIGFyZSB3b3JraW5nLgoKQnV0IHRob3NlIG11bHRpcGxlIGFsaWFzZXMgYXJl
IGltcG9ydGFudCBvbmx5IGZvciBtYWNoaW5lcyB3aXRoIGRldmljZQp0cmVlIHN1cHBvcnQsIGFy
ZW4ndCB0aGV5ID8KCkkgaG9wZSB0aGlzIHBhdGNoIHNlcmllcyBnZXRzIG1lcmdlZCBlYXJseSB0
byBsaW51eC1uZXh0IGluIHRoZSAzLjEwCmN5Y2xlIHNvIHRoZSBtdWx0aXBsZSBhY2N1bXVsYXRl
ZCBmaXh1cCBwYXRjaGVzIGZvciB0aGlzIGNsb2NrIGRyaXZlcgpjYW4gYmUgbWVyZ2VkIGFzIHdl
bGwgYW5kIGlzc3VlcyBsaWtlIHRoYXQgeW91IHBvaW50ZWQgb3V0IGNhbiBiZQpyZXNvbHZlZCB3
aXRoIGluY3JlbWVudGFsIHBhdGNoZXMuCgpSZWdhcmRzLApTeWx3ZXN0ZXIKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZGV2aWNldHJlZS1kaXNjdXNz
IG1haWxpbmcgbGlzdApkZXZpY2V0cmVlLWRpc2N1c3NAbGlzdHMub3psYWJzLm9yZwpodHRwczov
L2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vZGV2aWNldHJlZS1kaXNjdXNzCg==
