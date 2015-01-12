From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/3] ARM: dts: add fimd device support for
 exynos3250-rinato
Date: Mon, 12 Jan 2015 18:46:02 +0900
Message-ID: <54B397DA.7020109@samsung.com>
References: <1417174791-7339-1-git-send-email-inki.dae@samsung.com>
 <1417174791-7339-2-git-send-email-inki.dae@samsung.com>
 <54A7914D.5080601@samsung.com> <54B38FFA.9060103@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <54B38FFA.9060103@kernel.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Kukjin Kim <kgene@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjAxNeuFhCAwMeyblCAxMuydvCAxODoxMiwgS3VramluIEtpbSB3cm90ZToKPiBPbiAwMS8w
My8xNSAxNTo1MCwgSW5raSBEYWUgd3JvdGU6Cj4+IE9uIDIwMTTrhYQgMTHsm5QgMjjsnbwgMjA6
MzksIElua2kgRGFlIHdyb3RlOgo+Pj4gVGhpcyBwYXRjaCBhZGRzIGZpbWQgZGV2aWNlIG5vZGUg
d2hpY2ggaXMgYSBkaXNwbGF5IGNvbnRyb2xsZXIKPj4+IGZvciBFeHlub3MzMjUwIFJpbmF0byBi
b2FyZC4KPj4KPj4gSGkgS3VramluLAo+Pgo+PiBQbGVhc2UsIHBpbmd+Cj4+Cj4+IFRoYW5rcywK
Pj4gSW5raSBEYWUKPj4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBJbmtpIERhZSA8aW5raS5kYWVA
c2Ftc3VuZy5jb20+Cj4+PiBBY2tlZC1ieTogS3l1bmdtaW4gUGFyayA8a3l1bmdtaW4ucGFya0Bz
YW1zdW5nLmNvbT4KPj4+IC0tLQo+Pj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczMyNTAtcmlu
YXRvLmR0cyB8ICAgMTEgKysrKysrKysrKysKPj4+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9leHlub3MzMjUw
LXJpbmF0by5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3MzMjUwLXJpbmF0by5kdHMKPj4+
IGluZGV4IDgwYWE4YjQuLjc5YWE5MTYgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0
cy9leHlub3MzMjUwLXJpbmF0by5kdHMKPj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5v
czMyNTAtcmluYXRvLmR0cwo+Pj4gQEAgLTEyNSw2ICsxMjUsMTcgQEAKPj4+ICAJfTsKPj4+ICB9
Owo+Pj4gIAo+Pj4gKyZmaW1kIHsKPj4+ICsJc3RhdHVzID0gIm9rYXkiOwo+Pj4gKwo+Pj4gKwlp
ODAtaWYtdGltaW5ncyB7Cj4+PiArCQljcy1zZXR1cCA9IDwwPjsKPj4+ICsJCXdyLXNldHVwID0g
PDA+Owo+Pj4gKwkJd3ItYWN0ID0gPDE+Owo+Pj4gKwkJd3ItaG9sZCA9IDwwPjsKPj4+ICsJfTsK
Pj4+ICt9Owo+Pj4gKwo+Pj4gICZpMmNfMCB7Cj4+PiAgCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+
Pj4gIAkjc2l6ZS1jZWxscyA9IDwwPjsKPj4+Cj4gCj4gQXBwbGllZCB0aGlzIGFuZCAzcmQgb25l
Lgo+IEJUVywgSSBjYW4ndCBzZWUgdGhlICJzYW1zdW5nLHM2ZTYzajB4MDMiIHN1cHBvcnQgeWV0
PwoKSSBzZW50IGl0IHdpdGggYSBzZXBhcmF0ZWQgcGF0Y2ggQ2NpbmcgeW91LiBZb3UgY2FuIHJl
ZmVyIHRvIGJlbG93IGxpbmssCmh0dHA6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtc2Ft
c3VuZy1zb2MvbXNnMzk3NTYuaHRtbAoKVGhhbmtzLApJbmtpIERhZQoKPiAKPiAtIEt1a2ppbgo+
IC0tCj4gVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vi
c2NyaWJlIGRldmljZXRyZWUiIGluCj4gdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9t
b0B2Z2VyLmtlcm5lbC5vcmcKPiBNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5r
ZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
