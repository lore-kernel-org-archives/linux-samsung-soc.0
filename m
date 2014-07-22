From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 00/12] drm/exynos/ipp: image post processing improvements,
 part three
Date: Tue, 22 Jul 2014 22:42:02 +0900
Message-ID: <53CE6A2A.7090602@samsung.com>
References: <1404393037-17299-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1404393037-17299-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjAxNOuFhCAwN+yblCAwM+ydvCAyMjoxMCwgQW5kcnplaiBIYWpkYSB3cm90ZToKPiBUaGlz
IHNldCBvZiBpbmRlcGVuZGVudCBwYXRjaGVzIGNvbnRhaW5zIHZhcmlvdXMgaW1wcm92ZW1lbnQg
YW5kIGZpeGVzCj4gZm9yIGV4eW5vc19kcm0gaXBwIGZyYW1ld29yay4KPiBUaGUgcGF0Y2hzZXQg
aXMgYmFzZWQgb24gZXh5bm9zLWRybS1uZXh0IGJyYW5jaC4KCkFwcGxpZWQuCgpUaGFua3MsCklu
a2kgRGFlCgo+IAo+IFJlZ2FyZHMKPiBBbmRyemVqCj4gCj4gCj4gQW5kcnplaiBIYWpkYSAoMTIp
Ogo+ICAgZHJtL2V4eW5vcy9pcHA6IHJlbW92ZSB0eXBlIGNhc3RpbmcKPiAgIGRybS9leHlub3Mv
aXBwOiByZW1vdmUgdW51c2VkIGZpZWxkIGZyb20gZXh5bm9zX2RybV9pcHBfcHJpdmF0ZQo+ICAg
ZHJtL2V4eW5vcy9pcHA6IHJlbW92ZSBzdHJ1Y3QgZXh5bm9zX2RybV9pcHBfcHJpdmF0ZQo+ICAg
ZHJtL2V4eW5vcy9pcHA6IGNvcnJlY3QgYWRkcmVzcyB0eXBlCj4gICBkcm0vZXh5bm9zL2lwcDog
cmVtb3ZlIHRlbXBvcmFyeSB2YXJpYWJsZQo+ICAgZHJtL2V4eW5vcy9pcHA6IHJlbW92ZSBpbmNv
cnJlY3QgY2hlY2tzIG9mIGxpc3RfZmlyc3RfZW50cnkgcmVzdWx0Cj4gICBkcm0vZXh5bm9zL2lw
cDogc2ltcGxpZnkgbWVtb3J5IGNoZWNrIGZ1bmN0aW9uCj4gICBkcm0vZXh5bm9zL2lwcDogcmVt
b3ZlIHVzZWxlc3MgcmVnaXN0cmF0aW9uIGNoZWNrcwo+ICAgZHJtL2V4eW5vcy9pcHA6IHNpbXBs
aWZ5IGlwcF9maW5kX29iago+ICAgZHJtL2V4eW5vcy9pcHA6IHJlbW92ZSByZWR1bmRhbnQgbWVz
c2FnZXMKPiAgIGRybS9leHlub3MvaXBwOiBzaW1wbGlmeSBpcHBfY3JlYXRlX2lkCj4gICBkcm0v
ZXh5bm9zL2lwcDogc2ltcGxpZnkgaXBwX2ZpbmRfZHJpdmVyCj4gCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9kcnYuaCB8ICAgNyArLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1faXBwLmMgfCAyNTkgKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2lwcC5oIHwgICA0ICstCj4g
IDMgZmlsZXMgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKSwgMTk3IGRlbGV0aW9ucygtKQo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
