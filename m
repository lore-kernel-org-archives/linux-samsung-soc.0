From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 3/7] DMA: PL330: Add DMA capabilities
Date: Tue, 12 Jul 2011 14:02:30 +0530
Message-ID: <CABb+yY0M659Ob0u+wOBW5i6v_VfpayRkY29-TUNpsp1oVLn-SQ@mail.gmail.com>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
	<1309781915-31549-4-git-send-email-kgene.kim@samsung.com>
	<CAPTzV15Y7JFDKsec8x-M0C1AFLOMp39QvHpRCsO=E001P_tH9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:44064 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751628Ab1GLIcb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jul 2011 04:32:31 -0400
Received: by bwd5 with SMTP id 5so3853623bwd.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Jul 2011 01:32:30 -0700 (PDT)
In-Reply-To: <CAPTzV15Y7JFDKsec8x-M0C1AFLOMp39QvHpRCsO=E001P_tH9A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <parkch98@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Grant Likely <grant.likely@secretlab.ca>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Boojin Kim <boojin.kim@samsung.com>

T24gVHVlLCBKdWwgNSwgMjAxMSBhdCAxMjowMyBQTSwgQ2hhbmhvIFBhcmsgPHBhcmtjaDk4QGdt
YWlsLmNvbT4gd3JvdGU6Cj4gS3VramluIEtpbSA8a2dlbmUua2ltIDxhdD4gc2Ftc3VuZy5jb20+
IHdyaXRlczoKPgo+IChzbmlwKQo+Cj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKHNsYXZlX2Nv
bmZpZy0+ZGlyZWN0aW9uID09IERNQV9UT19ERVZJQ0UpIHsKPj4gKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBpZiAoc2xhdmVfY29uZmlnLT5kc3RfYWRkcikKPj4gKyDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwZXJpLT5maWZvX2FkZHIgPSBzbGF2ZV9j
b25maWctPmRzdF9hZGRyOwo+PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChz
bGF2ZV9jb25maWctPmRzdF9hZGRyX3dpZHRoKSB7Cj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgaSA9IDA7Cj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgd2hpbGUgKHNsYXZlX2NvbmZpZy0+ZHN0X2FkZHJfd2lkdGggIT0g
KDEgPDwKPiBpKSkKPj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBpKys7Cj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgcGVyaS0+YnVyc3Rfc3ogPSBpOwo+PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIH0KPj4gKyDCoCDCoCDCoCDCoCDCoCDCoCB9IGVsc2UgaWYgKHNsYXZlX2NvbmZpZy0+
ZGlyZWN0aW9uID09IERNQV9GUk9NX0RFVklDRSkgewo+PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGlmIChzbGF2ZV9jb25maWctPnNyY19hZGRyKQo+PiArIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBlcmktPmZpZm9fYWRkciA9IHNsYXZlX2NvbmZp
Zy0+c3JjX2FkZHI7Cj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKHNsYXZl
X2NvbmZpZy0+c3JjX2FkZHJfd2lkdGgpIHsKPj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBpID0gMDsKPj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB3aGlsZSAoc2xhdmVfY29uZmlnLT5zcmNfYWRkcl93aWR0aCAhPSAoMSA8
PAo+IGkpKQo+PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGkrKzsKPj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBwZXJpLT5idXJzdF9zeiA9IGk7Cj4KPiBSZS1zZW5kIGluY2x1ZGluZyBjYyBhbmQgbWFp
bGluZyBsaXN0cwo+IC0tCj4gcGwzMzAgZG1hYyBvbmx5IHN1cHBvcnRzIDEvMi80LzgvMTYgYnl0
ZXMgYnVyc3Qgc2l6ZS4KPiBJZiBzb21lIGJhZCBEL0QgZG9lc24ndCB1c2UgcG93ZXJzIG9mIDIg
d2lkdGgsCj4gZG1hZW5naW5lIGlzIGdvaW5nIHRvIGluZmluaXRlIGxvb3AuCj4gWW91J2QgYmV0
dGVyIGNoZWNrIGl0IGluc3RlYWQgb2YgcnVubmluZyBsb29wLgo+Ckl0IG1pZ2h0IGJlIGV2ZW4g
YmV0dGVyIHRvIHN0YXJ0IHdpdGggbWF4IHBvc3NpYmxlIHdpZHRoIGFuZAprZWVwIGRlY3JlYXNp
bmcgJ2knIGluIHRoZSBsb29wLgo=
