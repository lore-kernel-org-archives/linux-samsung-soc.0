From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/2] Use drm-core helpers to wait for updates
Date: Fri, 23 Sep 2016 10:15:22 +0200
Message-ID: <1474618524-8916-1-git-send-email-a.hajda@samsung.com>
References: <CGME20160923081538eucas1p16f72b58a8c885c07e8188fd33dfafa8c@eucas1p1.samsung.com>
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
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgSW5raSwKClRoZXNlIHR3byBwYXRjaGVzIHJlcGxhY2VzIGV4eW5vcy1kcm0gc3BlY2lmaWMg
bWVjaGFuaXNtIGZvciB3YWl0aW5nCmZvciB2YmxhbmtzIHdpdGggdGhlIG9uZSBwcm92aWRlZCBi
eSBkcm0tY29yZS4KVGhlIHBhdGNoc2V0IGhhcyBuaWNlIGRpZmZzdGF0IGFuZCBmaXhlcyBzb21l
IGlzc3VlcywKZGVzY3JpYmVkIGluIGRhdGFpbCBpbiBwYXRjaGVzLgoKQXMgdGhlIHBhdGNoZXMg
dG91Y2hlcyBleHlub3MtZHJtIGNvcmUgSSBoYXZlIHRlc3RlZCB0aGVtIGluIGRpZmZlcmVudApz
Y2VuYXJpb3Mgb24gZGlmZmVyZW50IHBpcGVsaW5lczoKLSBUTTI6IHZpZGksIHR2LCBkc2ksCi0g
T2Ryb2lkLXUzOiB2aWRpLCB0diwKLSBVbml2ZXJzYWwtYzIxMDogdmlkaSwgdHYsIHJnYi4KCklu
IGFsbCBjYXNlcyBpdCB3b3JrZWQuCgpSZWdhcmRzCkFuZHJ6ZWoKCgpBbmRyemVqIEhhamRhICgy
KToKICBkcm0vZXh5bm9zL3ZpZGk6IHVzZSB0aW1lciBmb3IgdmJsYW5rcyBpbnN0ZWFkIG9mIHNs
ZWVwaW5nIHdvcmtlcgogIGRybS9leHlub3M6IGZpeCBwZW5kaW5nIHVwZGF0ZSBoYW5kbGluZwoK
IGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9jcnRjLmMgfCAxNiArLS0tLS0tLQog
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5jICB8IDQ0ICstLS0tLS0tLS0t
LS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5oICB8ICAy
IC0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV92aWRpLmMgfCA2NiArKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25z
KCspLCAxMDYgZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
