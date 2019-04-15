From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/2] drm/fimd: use DRM_ERROR instead of DRM_INFO in
 error case
Date: Mon, 15 Apr 2019 13:05:08 +0900
Message-ID: <a24a2121-be38-11be-51a7-2355a2f36447@samsung.com>
References: <1555289240-7735-1-git-send-email-inki.dae@samsung.com>
 <CGME20190415004658epcas1p4203cd2876c49e7157fdab6b17293976e@epcas1p4.samsung.com>
 <1555289240-7735-2-git-send-email-inki.dae@samsung.com>
 <20190415031739.GA9897@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190415031739.GA9897@ravnborg.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

SGkgU2FtLAoKMTkuIDQuIDE1LiDsmKTtm4QgMTI6MTfsl5AgU2FtIFJhdm5ib3JnIOydtCjqsIAp
IOyTtCDquIA6Cj4gSGkgSW5raQo+IAo+IE9uIE1vbiwgQXByIDE1LCAyMDE5IGF0IDA5OjQ3OjE5
QU0gKzA5MDAsIElua2kgRGFlIHdyb3RlOgo+PiBUaGlzIHBhdGNoIG1ha2VzIGVycm9yIG1lc3Nh
Z2VzIHRvIGJlIHByaW50ZWQgb3V0IHVzaW5nIERSTV9FUlJPUgo+PiBpbnN0ZWFkIG9mIERSTV9J
TkZPLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+
Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYyB8IDYg
KysrLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Zp
bWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9maW1kLmMKPj4gaW5kZXgg
Nzg2YThlZS4uNzg0MjdlYyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfZHJtX2ZpbWQuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZmltZC5jCj4+IEBAIC00MDAsNyArNDAwLDcgQEAgc3RhdGljIGludCBmaW1kX2F0b21pY19j
aGVjayhzdHJ1Y3QgZXh5bm9zX2RybV9jcnRjICpjcnRjLAo+PiAgCXUzMiBjbGtkaXY7Cj4+ICAK
Pj4gIAlpZiAobW9kZS0+Y2xvY2sgPT0gMCkgewo+PiAtCQlEUk1fSU5GTygiTW9kZSBoYXMgemVy
byBjbG9jayB2YWx1ZS5cbiIpOwo+PiArCQlEUk1fRVJST1IoIk1vZGUgaGFzIHplcm8gY2xvY2sg
dmFsdWUuXG4iKTsKPiAKPiBUbyBnaXZlIHRoZSBsb2dzIGEgbW9yZSBwcmVjaXNlIGluZm8gb24g
d2hlcmUgaXMgY29tZXMgZnJvbSB5b3UKPiBjb3VsZCBjb25zaWRlciB0byB1c2U6Cj4gCj4gCQlE
Uk1fREVWX0VSUk9SKGN0eC0+ZGV2LCAiTW9kZSBoYXMgemVybyBjbG9jayB2YWx1ZS5cbiIpOwoK
VGhhbmtzIGZvciBjb21tZW50IGFuZCBsb29rcyBiZXR0ZXIuIDopClRoaXMgcGF0Y2ggY29ycmVj
dHMgdGhlIHVzZSBvZiBsb2cgbWFjcm8gc28gSSB3aWxsIG1ha2UgYW5kIHB1c2ggYSBuZXcgcGF0
Y2ggLSB3aGljaCBjaGFuZ2VzIGFsbCBleGlzdGluZyBEUk1fRVJST1IgbWFjcm9zIHRvIERSTV9E
RVZfRVJST1IgLSBvbiB0b3Agb2YgdGhpcyBwYXRjaCBzZXJpZXMuCgpUaGFua3MsCklua2kgRGFl
Cgo+IAo+IExpa2V3aXNlIGJlbG93Lgo+IAo+IAo+IAlTYW0KPiAKPiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
