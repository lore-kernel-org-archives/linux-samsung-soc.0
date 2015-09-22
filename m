From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 07/13] tests/exynos: use XRGB8888 for framebuffer
Date: Tue, 22 Sep 2015 17:54:56 +0200
Message-ID: <1442937302-8211-8-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1442937302-8211-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1442937302-8211-1-git-send-email-tjakobi@math.uni-bielefeld.de>
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
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, gustavo.padovan@collabora.co.uk
List-Id: linux-samsung-soc@vger.kernel.org

VGhpcyBtYXRjaGVzIHRoZSBHMkQgY29sb3IgbW9kZSB0aGF0IGlzIHVzZWQgaW4gdGhlIGVudGly
ZSBjb2RlLgpUaGUgcHJldmlvdXMgKGluY29ycmVjdCkgUkdCQTg4ODggd291bGQgb25seSB3b3Jr
IHNpbmNlIHRoZQpFeHlub3MgbWl4ZXIgZGlkIGl0cyBjb25maWd1cmF0aW9uIGJhc2VkIG9uIHRo
ZSBicHAsIGFuZCBub3QKYmFzZWQgb24gdGhlIGFjdHVhbCBwaXhlbGZvcm1hdC4KClNpZ25lZC1v
ZmYtYnk6IFRvYmlhcyBKYWtvYmkgPHRqYWtvYmlAbWF0aC51bmktYmllbGVmZWxkLmRlPgotLS0K
IHRlc3RzL2V4eW5vcy9leHlub3NfZmltZzJkX3Rlc3QuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2V4eW5v
cy9leHlub3NfZmltZzJkX3Rlc3QuYyBiL3Rlc3RzL2V4eW5vcy9leHlub3NfZmltZzJkX3Rlc3Qu
YwppbmRleCA4Nzk0ZGFjLi5kZmIwMGEwIDEwMDY0NAotLS0gYS90ZXN0cy9leHlub3MvZXh5bm9z
X2ZpbWcyZF90ZXN0LmMKKysrIGIvdGVzdHMvZXh5bm9zL2V4eW5vc19maW1nMmRfdGVzdC5jCkBA
IC02NzUsNyArNjc1LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCW9mZnNl
dHNbMF0gPSAwOwogCiAJcmV0ID0gZHJtTW9kZUFkZEZCMihkZXYtPmZkLCBzY3JlZW5fd2lkdGgs
IHNjcmVlbl9oZWlnaHQsCi0JCQkJRFJNX0ZPUk1BVF9SR0JBODg4OCwgaGFuZGxlcywKKwkJCQlE
Uk1fRk9STUFUX1hSR0I4ODg4LCBoYW5kbGVzLAogCQkJCXBpdGNoZXMsIG9mZnNldHMsICZmYl9p
ZCwgMCk7CiAJaWYgKHJldCA8IDApCiAJCWdvdG8gZXJyX2Rlc3Ryb3lfYnVmZmVyOwotLSAKMi4w
LjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
