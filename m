From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v2 0/4] drm/exynos: dp: consider port node outbound for panel
Date: Mon, 07 Dec 2015 21:52:34 +0900
Message-ID: <1449492758-19989-1-git-send-email-inki.dae@samsung.com>
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
To: dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, javier@osg.samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

VGhpcyBwYXRjaCBzZXJpZXMgY29uc2lkZXJzIGEgcG9ydCBub2RlIG91dGJvdW5kIGZvciBwYW5l
bCBkZXZpY2Ugbm9kZSwKaW5jbHVkaW5nIGR0IGJpbmRpbmcgZm9yIGl0LiBBbmQgYWxzbyBpdCBm
aXhlcyBhIHdyb25nIGVycm9yIHR5cGUuCgpDaGFuZ2Vsb2cgdjI6Ci0gYWRkIGEgcGF0Y2ggZnJv
bSBKYXZpZXIsIHdoaWNoIGFsbG93cyBkcCB0byBjb25uZWN0IHBhbmVsIHVzaW5nIG9mIGdyYXBo
LgotIHJlbW92ZSB1bm5lY2Vzc2FyeSBwcm9wZXJ0aWVzIGFuZCBudW1iZXJpbmcgcG9pbnRlZCBv
dXQgYnkKICBSb2IgYW5kIEphdmllci4KLSB1cGRhdGUgZGVzY3JpcHRpb24gYWJvdXQgZURQIGRl
dmljZS4KClRoYW5rcywKSW5raSBEYWUKCklua2kgRGFlICgzKToKICBkcm0vZXh5bm9zOiBkcDog
YWRkIG9mX2dyYXBoIGR0IGJpbmRpbmcgc3VwcG9ydCBmb3IgcGFuZWwKICBkcm0vZXh5bm9zOiBk
cDogZml4IHdyb25nIHJldHVybiB0eXBlCiAgZHQtYmluZGluZ3M6IGV4eW5vcy1kcDogdXBkYXRl
IHBvcnRzIG5vZGUgYmluZGluZyBmb3IgcGFuZWwKCkphdmllciBNYXJ0aW5leiBDYW5pbGxhcyAo
MSk6CiAgQVJNOiBkdHM6IFVzZSBPRiBncmFwaCBmb3IgRFAgdG8gcGFuZWwgY29ubmVjdGlvbiBp
bgogICAgZXh5bm9zNTgwMC1wZWFjaC1waQoKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2V4eW5vcy9l
eHlub3NfZHAudHh0ICAgICAgICAgIHwgNDEgKysrKysrKysrKysrKysrKysrKy0tLQogYXJjaC9h
cm0vYm9vdC9kdHMvZXh5bm9zNTgwMC1wZWFjaC1waS5kdHMgICAgICAgICAgfCAxNSArKysrKysr
LQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHBfY29yZS5jICAgICAgICAgICAgfCAy
NyArKysrKysrKysrKystLQogMyBmaWxlcyBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQoKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
