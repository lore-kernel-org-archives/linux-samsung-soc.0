From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v4] drm/exynos: mixer: configure layers once in
 mixer_atomic_flush()
Date: Wed, 28 Sep 2016 23:12:00 +0200
Message-ID: <1475097121-5287-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-samsung-soc@vger.kernel.org
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8gZXZlcnlvbmUsCgp0aGUgcmVjZW50IGRpc2N1c3Npb24gYWJvdXQgdGhpcyBwYXRjaCBo
YXMgbWFkZSBtZSByZWFsaXNlIHRoYXQgdGhlIHB1cnBvc2Ugb2YgdGhlIHBhdGNoLCBhbmQgaW4g
cGFydGljdWxhciB3aGF0IGl0IGRvZXMsIGFuZCB3aGF0IGRvZXMgbm90LCB3YXMgdG9vIHVuY2xl
YXIuIEhlbmNlIEknbSByZXNlbmRpbmcgdGhlIHBhdGNoIHdpdGggYSAoaG9wZWZ1bGx5KSBpbXBy
b3ZlZCBhbmQgZXhwYW5kZWQgY29tbWl0IGRlc2NyaXB0aW9uLgoKV2l0aCBiZXN0IHdpc2hlcywK
VG9iaWFzCgpUb2JpYXMgSmFrb2JpICgxKToKICBkcm0vZXh5bm9zOiBtaXhlcjogY29uZmlndXJl
IGxheWVycyBvbmNlIGluIG1peGVyX2F0b21pY19mbHVzaCgpCgogZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfbWl4ZXIuYyB8IDEzNSArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL3JlZ3MtbWl4ZXIuaCAgIHwgICAyICsKIDIgZmls
ZXMgY2hhbmdlZCwgOTIgaW5zZXJ0aW9ucygrKSwgNDUgZGVsZXRpb25zKC0pCgotLSAKMi43LjMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
