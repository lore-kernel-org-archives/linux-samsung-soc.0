From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/2] drm/exynos: dsi: move of_drm_find_bridge call into
 probe
Date: Tue, 04 Jul 2017 07:48:03 +0900
Message-ID: <595AC9A3.3070606@samsung.com>
References: <CGME20170703072801epcas1p3cbabe54a8457771f906378b1036294b6@epcas1p3.samsung.com>
 <1499066879-13241-1-git-send-email-inki.dae@samsung.com>
 <1499066879-13241-2-git-send-email-inki.dae@samsung.com>
 <CAJKOXPeYBYzJx13Z=+BVADMKyCGmc_QYf+6jn+qd+rStUtxiNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CAJKOXPeYBYzJx13Z=+BVADMKyCGmc_QYf+6jn+qd+rStUtxiNQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

SGkgS3J6eXN6dG9mLAoKMjAxN+uFhCAwN+yblCAwNOydvCAwNDowNeyXkCBLcnp5c3p0b2YgS296
bG93c2tpIOydtCjqsIApIOyTtCDquIA6Cj4gT24gTW9uLCBKdWwgMywgMjAxNyBhdCA5OjI3IEFN
LCBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+IHdyb3RlOgo+PiBUaGlzIHBhdGNoIG1v
dmVzIG9mX2RybV9maW5kX2JyaWRnZSBjYWxsIGludG8gcHJvYmUuCj4+Cj4+IEl0IGRvZXNuJ3Qg
bmVlZCB0byBjYWxsIG9mX2RybV9maW5kX2JyaWRnZSBmdW5jdGlvbiBldmVyeSB0aW1lCj4+IGJp
bmQgY2FsbGJhY2sgaXMgY2FsbGVkLiBJdCdzIGVub3VnaCB0byBjYWxsIHRoaXMgZnVuY2F0aW9u
Cj4+IGF0IHByb2JlIG9uZSB0aW1lLgo+Pgo+PiBTdWdnZXN0ZWQtYnk6IElua2kgRGFlIDxpbmtp
LmRhZUBzYW1zdW5nLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogU2h1YWggS2hhbiA8c2h1YWhraEBv
c2cuc2Ftc3VuZy5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1z
dW5nLmNvbT4KPiAKPiBIaSBJbmtpLAo+IAo+IE1pbm9yIG5vdGU6IHlvdSdyZSB0aGUgYXV0aG9y
IG9mIHRoaXMgcGF0Y2ggc28geW91IGNhbm5vdCBzdWdnZXN0IGl0LiA6KQo+IAoKSSBqdXN0IHdh
bnRlZCB0byBsZWF2ZSB0aGUgdmVzdGlnZSBvZiB0aGUgb3JpZ2luYWwgcGF0Y2hbMV0gcG9zdGVk
IGJ5IFNodWFoIHdpdGggbXkgc3VnZ2VzdGlvbiBoZXJlLgpCdXQgeWVzLCBsb29rcyBzdHJhbmdl
LiA6KQoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvOTgwODQ5Ny8KClRo
YW5rcywKSW5raSBEYWUKCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo+IAo+IAo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
