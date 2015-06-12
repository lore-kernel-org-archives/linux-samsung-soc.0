From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 4/9] tests/exynos: clean struct connector
Date: Fri, 12 Jun 2015 20:15:09 +0200
Message-ID: <1434132914-3150-5-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1434132914-3150-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1434132914-3150-1-git-send-email-tjakobi@math.uni-bielefeld.de>
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

UmVtb3ZlIGFsbCB1bnVzZWQgc3RydWN0IG1lbWJlcnMuIEFuIGluc3BlY3Rpb24gb2YgdGhlCmdp
dCBoaXN0b3J5IHNob3dzIHRoYXQgdGhlc2UgbWVtYmVycyB3ZXJlIGFsc28gbmV2ZXIKdXNlZCBp
biB0aGUgcGFzdC4KClNpZ25lZC1vZmYtYnk6IFRvYmlhcyBKYWtvYmkgPHRqYWtvYmlAbWF0aC51
bmktYmllbGVmZWxkLmRlPgotLS0KIHRlc3RzL2V4eW5vcy9leHlub3NfZmltZzJkX3Rlc3QuYyB8
IDEwIC0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS90ZXN0cy9leHlub3MvZXh5bm9zX2ZpbWcyZF90ZXN0LmMgYi90ZXN0cy9leHlub3MvZXh5
bm9zX2ZpbWcyZF90ZXN0LmMKaW5kZXggNjRkYWNmYS4uNmFmOTI3NyAxMDA2NDQKLS0tIGEvdGVz
dHMvZXh5bm9zL2V4eW5vc19maW1nMmRfdGVzdC5jCisrKyBiL3Rlc3RzL2V4eW5vcy9leHlub3Nf
ZmltZzJkX3Rlc3QuYwpAQCAtNjUsMTcgKzY1LDkgQEAgc3RydWN0IGZpbWcyZF90ZXN0X2Nhc2Ug
ewogc3RydWN0IGNvbm5lY3RvciB7CiAJdWludDMyX3QgaWQ7CiAJY2hhciBtb2RlX3N0cls2NF07
Ci0JY2hhciBmb3JtYXRfc3RyWzVdOwotCXVuc2lnbmVkIGludCBmb3VyY2M7CiAJZHJtTW9kZU1v
ZGVJbmZvICptb2RlOwogCWRybU1vZGVFbmNvZGVyICplbmNvZGVyOwogCWludCBjcnRjOwotCWlu
dCBwaXBlOwotCWludCBwbGFuZV96cG9zOwotCXVuc2lnbmVkIGludCBmYl9pZFsyXSwgY3VycmVu
dF9mYl9pZDsKLQlzdHJ1Y3QgdGltZXZhbCBzdGFydDsKLQotCWludCBzd2FwX2NvdW50OwogfTsK
IAogc3RhdGljIHZvaWQgY29ubmVjdG9yX2ZpbmRfbW9kZShpbnQgZmQsIHN0cnVjdCBjb25uZWN0
b3IgKmMsCkBAIC03NTAsOCArNzQyLDYgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2
KQogCWlmIChyZXQgPCAwKQogCQlnb3RvIGVycl9kZXN0cm95X2J1ZmZlcjsKIAotCWNvbi5wbGFu
ZV96cG9zID0gLTE7Ci0KIAltZW1zZXQoYm8tPnZhZGRyLCAweGZmLCBzY3JlZW5fd2lkdGggKiBz
Y3JlZW5faGVpZ2h0ICogNCk7CiAKIAlyZXQgPSBkcm1fc2V0X2NydGMoZGV2LCAmY29uLCBmYl9p
ZCk7Ci0tIAoyLjAuNQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
