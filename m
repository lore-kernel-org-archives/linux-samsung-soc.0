From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 0/8] constify clk_ops structure
Date: Sat, 27 Oct 2018 07:47:34 +0200
Message-ID: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
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
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

RGVjbGFyZSBhcyBjb25zdCBjbGtfb3BzIHN0cnVjdHVyZXMgdGhhdCBhcmUgb25seSBzdG9yZWQg
aW4gY29uc3QgZmllbGRzIG9yCnBhc3NlZCB0byBmdW5jdGlvbnMgd2l0aCBjb25zdCBwYXJhbWV0
ZXJzLgoKSWRlbnRpZmllZCBhbmQgdHJhbnNmb3JtZWQgdXNpbmcgQ29jY2luZWxsZS4KClNpZ25l
ZC1vZmYtYnk6IEp1bGlhIExhd2FsbCA8SnVsaWEuTGF3YWxsQGxpcDYuZnI+CgotLS0KCiBhcmNo
L2FybS9tYWNoLXZleHByZXNzL3NwYy5jICAgICAgICAgICAgIHwgICAgMiArLQogZHJpdmVycy9j
bGsvY2xrLW1heDc3Njg2LmMgICAgICAgICAgICAgICB8ICAgIDIgKy0KIGRyaXZlcnMvY2xrL2Ns
ay1wYWxtYXMuYyAgICAgICAgICAgICAgICAgfCAgICAyICstCiBkcml2ZXJzL2Nsay9jbGstczJt
cHMxMS5jICAgICAgICAgICAgICAgIHwgICAgMiArLQogZHJpdmVycy9jbGsvcGlzdGFjaGlvL2Ns
ay1wbGwuYyAgICAgICAgICB8ICAgIDggKysrKy0tLS0KIGRyaXZlcnMvY2xrL3B4YS9jbGstcHhh
LmMgICAgICAgICAgICAgICAgfCAgICA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9pbXgvaW14LXR2
ZS5jICAgICAgICAgICAgfCAgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRtaV9w
aHlfODk5Ni5jIHwgICAgMiArLQogOCBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAx
MiBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
