From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 04/15] tests/exynos: disable the G2D userptr/blend test
Date: Wed, 11 Feb 2015 10:11:43 +0900
Message-ID: <54DAAC4F.5020906@samsung.com>
References: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1422971645-30621-5-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1422971645-30621-5-git-send-email-tjakobi@math.uni-bielefeld.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: robclark@freedesktop.org, dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

SGksCgpPbiAwMi8wMy8yMDE1IDEwOjUzIFBNLCBUb2JpYXMgSmFrb2JpIHdyb3RlOgo+IFRoZSBi
bGVuZCB0ZXN0IHVzZXMgdGhlIHVzZXJwdHIgZnVuY3Rpb25hbGl0eSBvZiBleHlub3MtZHJtLCB3
aGljaAo+IGlzIGN1cnJlbnRseSBub3Qgc2FmZSB0byB1c2UuIElmIHRoZSBrZXJuZWwgaGFzbid0
IGJlZW4gYnVpbGQgd2l0aAo+IGV4eW5vcy1pb21tdSBzdXBwb3J0LCB0aGVuIHRoZSBibGVuZCB0
ZXN0IGlzIGdvaW5nIHRvIHByb2R1Y2UgKGtlcm5lbCkKPiBtZW1vcnkgY29ycnVwdGlvbiwgZXZl
bnR1YWxseSBsZWFkaW5nIHRvIGEgc3lzdGVtIGNyYXNoLgo+IAo+IERpc2FibGUgdGhlIHRlc3Qg
Zm9yIG5vdywgdW50aWwgdGhlIGtlcm5lbCBjb2RlIGhhcyBiZWVuIHNhbml0aXplZC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBUb2JpYXMgSmFrb2JpIDx0amFrb2JpQG1hdGgudW5pLWJpZWxlZmVsZC5k
ZT4KPiAtLS0KPiAgdGVzdHMvZXh5bm9zL2V4eW5vc19maW1nMmRfdGVzdC5jIHwgMiArKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2V4
eW5vcy9leHlub3NfZmltZzJkX3Rlc3QuYyBiL3Rlc3RzL2V4eW5vcy9leHlub3NfZmltZzJkX3Rl
c3QuYwo+IGluZGV4IGFhMTQwZTUuLjQ4ZGZlOTcgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvZXh5bm9z
L2V4eW5vc19maW1nMmRfdGVzdC5jCj4gKysrIGIvdGVzdHMvZXh5bm9zL2V4eW5vc19maW1nMmRf
dGVzdC5jCj4gQEAgLTc4OCwxMSArNzg4LDEzIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoq
YXJndikKPiAgCj4gIAlnZXRjaGFyKCk7Cj4gIAo+ICsjaWYgMAoKSG93IGFib3V0IGFkZCBzb21l
IGNvbW1lbnRzIGFib3V0IHdoeSBuZWVkIGRpc2FibGU/CgpUaGFua3MuCgo+ICAJcmV0ICA9IHRl
c3RfY2FzZS5ibGVuZChkZXYsIHNyYywgYm8sIEcyRF9JTUdCVUZfVVNFUlBUUik7Cj4gIAlpZiAo
cmV0IDwgMCkKPiAgCQlmcHJpbnRmKHN0ZGVyciwgImZhaWxlZCB0byB0ZXN0IGJsZW5kIG9wZXJh
dGlvbi5cbiIpOwo+ICAKPiAgCWdldGNoYXIoKTsKPiArI2VuZGlmCj4gIAo+ICBlcnJfZnJlZV9z
cmM6Cj4gIAlpZiAoc3JjKQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
