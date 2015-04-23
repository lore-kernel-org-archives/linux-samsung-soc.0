From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: drm/exynos: add async G2D execution to libdrm (v3)
Date: Thu, 23 Apr 2015 16:29:19 +0200
Message-ID: <1429799366-12287-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-samsung-soc@vger.kernel.org
Cc: gustavo.padovan@collabora.co.uk, emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8sCgp0aGlzIHNlcmllcyBleHBvc2VzIGFzeW5jIGV4ZWN1dGlvbiBvZiBHMkQgY29tbWFu
ZCBidWZmZXJzIHRvIHVzZXJzcGFjZS4gQWxzbyBpbmNsdWRlcyBpcyBhIHNtYWxsIHBlcmZvcm1h
bmNlIGFuYWx5c2lzIHRlc3QsIHdoaWNoIGNhbiBhbHNvIGJlIHVzZWQgdG8gc3RyZXNzIHRlc3Qg
dGhlIGVuZ2luZS4gVGhlIGFzeW5jIG9wZXJhdGlvbiBpcyBvZiAKY291cnNlIGFsc28gdGVzdGVk
LgoKUGxlYXNlIHJldmlldyBhbmQgbGV0IG1lIGtub3cgd2hhdCBJIGNhbiBpbXByb3ZlLgoKdjM6
IFJld3JvdGUgaGFuZGxpbmcgb2YgdmVuZG9yLXNwZWNpZmljIGV2ZW50cy4gVGhlIHNlcmllcyBp
cyBub3cgYmFzZWQgb24gWzFdLiBBbHNvIGFkZGVkIHR3byBzbWFsbCBmaXhlcyAoZXJyb3IgaGFu
ZGxpbmcsIGJyZWFrIHN0YXRlbWVudCkuCgoKV2l0aCBiZXN0IHdpc2hlcywKVG9iaWFzCgpbMV0g
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC82MjYyNTQxLwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
