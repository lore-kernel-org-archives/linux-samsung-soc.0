From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/3] GPU-DRM-Exynos: Fine-tuning for six function
 implementations
Date: Tue, 24 Oct 2017 10:48:12 +0200
Message-ID: <7d4cdb43-432c-c67a-5d3f-c37bd604f539@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBUdWUsIDI0IE9jdCAyMDE3IDEwOjM0OjU2ICswMjAwCgpUaHJlZSB1cGRhdGUgc3VnZ2VzdGlv
bnMgd2VyZSB0YWtlbiBpbnRvIGFjY291bnQKZnJvbSBzdGF0aWMgc291cmNlIGNvZGUgYW5hbHlz
aXMuCgpNYXJrdXMgRWxmcmluZyAoMyk6CiAgVXNlIGNvbW1vbiBlcnJvciBoYW5kbGluZyBjb2Rl
IGluIGV4eW5vc19kc2lfZW5hYmxlKCkKICBVc2UgY29tbW9uIGVycm9yIGhhbmRsaW5nIGNvZGUg
aW4gZXh5bm9zX2RybV9nZW1faW5pdCgpCiAgRml4IHR5cG9zIGluIGZpdmUgY29tbWVudCBsaW5l
cwoKIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYyAgfCAxMiArKysrKysr
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9maW1jLmMgfCAgMiArLQog
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYyB8ICAyICstCiBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9nZW0uYyAgfCAxNiArKysrKysrKystLS0tLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1faXBwLmMgIHwgIDIgKy0KIDYgZmlsZXMgY2hhbmdl
ZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgotLSAKMi4xNC4yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
