From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 4/9] tests/exynos: clean struct connector
Date: Wed, 10 Jun 2015 15:42:23 +0200
Message-ID: <1433943748-15849-5-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1433943748-15849-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1433943748-15849-1-git-send-email-tjakobi@math.uni-bielefeld.de>
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

UmVtb3ZlIGFsbCB1bnVzZWQgc3RydWN0IG1lbWJlcnMuCgpTaWduZWQtb2ZmLWJ5OiBUb2JpYXMg
SmFrb2JpIDx0amFrb2JpQG1hdGgudW5pLWJpZWxlZmVsZC5kZT4KLS0tCiB0ZXN0cy9leHlub3Mv
ZXh5bm9zX2ZpbWcyZF90ZXN0LmMgfCAxMCAtLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvZXh5bm9zL2V4eW5vc19maW1nMmRfdGVz
dC5jIGIvdGVzdHMvZXh5bm9zL2V4eW5vc19maW1nMmRfdGVzdC5jCmluZGV4IDY0ZGFjZmEuLjZh
ZjkyNzcgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2V4eW5vcy9leHlub3NfZmltZzJkX3Rlc3QuYworKysg
Yi90ZXN0cy9leHlub3MvZXh5bm9zX2ZpbWcyZF90ZXN0LmMKQEAgLTY1LDE3ICs2NSw5IEBAIHN0
cnVjdCBmaW1nMmRfdGVzdF9jYXNlIHsKIHN0cnVjdCBjb25uZWN0b3IgewogCXVpbnQzMl90IGlk
OwogCWNoYXIgbW9kZV9zdHJbNjRdOwotCWNoYXIgZm9ybWF0X3N0cls1XTsKLQl1bnNpZ25lZCBp
bnQgZm91cmNjOwogCWRybU1vZGVNb2RlSW5mbyAqbW9kZTsKIAlkcm1Nb2RlRW5jb2RlciAqZW5j
b2RlcjsKIAlpbnQgY3J0YzsKLQlpbnQgcGlwZTsKLQlpbnQgcGxhbmVfenBvczsKLQl1bnNpZ25l
ZCBpbnQgZmJfaWRbMl0sIGN1cnJlbnRfZmJfaWQ7Ci0Jc3RydWN0IHRpbWV2YWwgc3RhcnQ7Ci0K
LQlpbnQgc3dhcF9jb3VudDsKIH07CiAKIHN0YXRpYyB2b2lkIGNvbm5lY3Rvcl9maW5kX21vZGUo
aW50IGZkLCBzdHJ1Y3QgY29ubmVjdG9yICpjLApAQCAtNzUwLDggKzc0Miw2IEBAIGludCBtYWlu
KGludCBhcmdjLCBjaGFyICoqYXJndikKIAlpZiAocmV0IDwgMCkKIAkJZ290byBlcnJfZGVzdHJv
eV9idWZmZXI7CiAKLQljb24ucGxhbmVfenBvcyA9IC0xOwotCiAJbWVtc2V0KGJvLT52YWRkciwg
MHhmZiwgc2NyZWVuX3dpZHRoICogc2NyZWVuX2hlaWdodCAqIDQpOwogCiAJcmV0ID0gZHJtX3Nl
dF9jcnRjKGRldiwgJmNvbiwgZmJfaWQpOwotLSAKMi4wLjUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
