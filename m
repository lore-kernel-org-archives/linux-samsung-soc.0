From: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH V2] gpu/drm/exynos/exynos_hdmi - Unmap region obtained by
 of_iomap
Date: Wed, 19 Oct 2016 23:18:31 +0900
Message-ID: <CAAQKjZPtedAyC9yUB5uT6XTrc_2RJsaivwk-5Ep1dmdMnd3zZw@mail.gmail.com>
References: <1476871456-1098-1-git-send-email-arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1476871456-1098-1-git-send-email-arvind.yadav.cs@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, krzk@kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

V2lsbCBwaWNrIGl0IHVwIHNvb24uCgpUaGFua3MsCklua2kgRGFlCgoyMDE2LTEwLTE5IDE5OjA0
IEdNVCswOTowMCBBcnZpbmQgWWFkYXYgPGFydmluZC55YWRhdi5jc0BnbWFpbC5jb20+Ogo+IEZy
ZWUgbWVtb3J5IG1hcHBpbmcsIGlmIGhkbWlfcHJvYmUgaXMgbm90IHN1Y2Nlc3NmdWwuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBBcnZpbmQgWWFkYXYgPGFydmluZC55YWRhdi5jc0BnbWFpbC5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2hkbWkuYyB8ICAgIDUgKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2hkbWkuYwo+IGluZGV4IDIyNzVlZmUuLmJhMjhkZWMgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfaGRtaS5jCj4gQEAgLTE5MDEsNiArMTkwMSw4IEBAIGVycl9kaXNhYmxl
X3BtX3J1bnRpbWU6Cj4gIGVycl9oZG1pcGh5Ogo+ICAgICAgICAgaWYgKGhkYXRhLT5oZG1pcGh5
X3BvcnQpCj4gICAgICAgICAgICAgICAgIHB1dF9kZXZpY2UoJmhkYXRhLT5oZG1pcGh5X3BvcnQt
PmRldik7Cj4gKyAgICAgICBpZiAoaGRhdGEtPnJlZ3NfaGRtaXBoeSkKPiArICAgICAgICAgICAg
ICAgaW91bm1hcChoZGF0YS0+cmVnc19oZG1pcGh5KTsKPiAgZXJyX2RkYzoKPiAgICAgICAgIHB1
dF9kZXZpY2UoJmhkYXRhLT5kZGNfYWRwdC0+ZGV2KTsKPgo+IEBAIC0xOTIzLDYgKzE5MjUsOSBA
QCBzdGF0aWMgaW50IGhkbWlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
ICAgICAgICBpZiAoaGRhdGEtPmhkbWlwaHlfcG9ydCkKPiAgICAgICAgICAgICAgICAgcHV0X2Rl
dmljZSgmaGRhdGEtPmhkbWlwaHlfcG9ydC0+ZGV2KTsKPgo+ICsgICAgICAgaWYgKGhkYXRhLT5y
ZWdzX2hkbWlwaHkpCj4gKyAgICAgICAgICAgICAgIGlvdW5tYXAoaGRhdGEtPnJlZ3NfaGRtaXBo
eSk7Cj4gKwo+ICAgICAgICAgcHV0X2RldmljZSgmaGRhdGEtPmRkY19hZHB0LT5kZXYpOwo+Cj4g
ICAgICAgICByZXR1cm4gMDsKPiAtLQo+IDEuNy45LjUKPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
