From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v6 05/10] ARM: dts: Fill in bootargs for exynos5250-snow
Date: Sat,  2 Aug 2014 02:52:25 +0200
Message-ID: <1406940750-15880-6-git-send-email-afaerber@suse.de>
References: <1406940750-15880-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1406940750-15880-1-git-send-email-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, open list <linux-kernel@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Kumar Gala <galak@codeaurora.org>, Stephan van Schaik <stephan@synkhronix.com>, Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, Ben Dooks <ben-linux@fluff.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Russell King <linux@arm.linux.org.uk>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

ZXh5bm9zNTI1MC1jcm9zLWNvbW1vbi5kdHNpIGhhZCBhbiBlbXB0eSAvY2hvc2VuIG5vZGUuCkZp
bGwgaW4gZXhlbXBsYXJ5IGJvb3QgYXJndW1lbnRzLgoKUmV2aWV3ZWQtYnk6IFRvbWFzeiBGaWdh
IDx0LmZpZ2FAc2Ftc3VuZy5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgRsOkcmJlciA8YWZh
ZXJiZXJAc3VzZS5kZT4KLS0tCiB2NSAtPiB2NjogVW5jaGFuZ2VkCgogdjU6IE5ldwogQ2xlYW51
cCBmb3IgL2Nob3NlbiBub2RlIG1vdmVkIGludG8gLXNub3cuZHRzLgoKIGFyY2gvYXJtL2Jvb3Qv
ZHRzL2V4eW5vczUyNTAtc25vdy5kdHMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczUyNTAtc25vdy5kdHMg
Yi9hcmNoL2FybS9ib290L2R0cy9leHlub3M1MjUwLXNub3cuZHRzCmluZGV4IDQwY2FkNDNmOGEx
MS4uOGQ4ZTYyZGU4NmM3IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M1MjUw
LXNub3cuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczUyNTAtc25vdy5kdHMKQEAg
LTI3LDYgKzI3LDcgQEAKIAl9OwogCiAJY2hvc2VuIHsKKwkJYm9vdGFyZ3MgPSAiY29uc29sZT10
dHkxIjsKIAl9OwogCiAJZ3Bpby1rZXlzIHsKLS0gCjEuOS4zCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxp
c3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
