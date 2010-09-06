From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 3/4] ARM: S5PC110: add common FIMC setup code
Date: Mon, 6 Sep 2010 13:52:24 +0900
Message-ID: <AANLkTinhbmKX5gs4TPZwVUX0WSEQ5RLN+_gHAqXsTj1b@mail.gmail.com>
References: <1283745044-15514-1-git-send-email-m.szyprowski@samsung.com>
	<1283745044-15514-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:53198 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751170Ab0IFEw0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Sep 2010 00:52:26 -0400
Received: by wwj40 with SMTP id 40so5947635wwj.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Sep 2010 21:52:24 -0700 (PDT)
In-Reply-To: <1283745044-15514-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

T24gTW9uLCBTZXAgNiwgMjAxMCBhdCAxMjo1MCBQTSwgTWFyZWsgU3p5cHJvd3NraQo8bS5zenlw
cm93c2tpQHNhbXN1bmcuY29tPiB3cm90ZToKLi4uLgo+ICsgwqAgwqAgwqAgcGFyZW50ID0gY2xr
X2dldChOVUxMLCAibW91dF9lcGxsIik7Cj4gKyDCoCDCoCDCoCBpZiAoSVNfRVJSKHBhcmVudCkp
Cj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gUFRSX0VSUihwYXJlbnQpOwo+ICsKPiAr
IMKgIMKgIMKgIGZvciAoaSA9IDA7IGVyciA9PSAwICYmIGkgPCBBUlJBWV9TSVpFKGZpbWNfZGV2
cyk7IGkrKykgewo+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKGZpbWNfZGV2c1tpXSkgewo+
ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY2xrX2ZpbWMgPSBjbGtfZ2V0KGZp
bWNfZGV2c1tpXSwgInNjbGtfZmltYyIpOwo+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgaWYgKElTX0VSUihjbGtfZmltYykpIHsKPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVyciA9IFBUUl9FUlIoY2xrX2ZpbWMpOwo+ICsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7Cj4gKyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Cj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBjbGtfc2V0X3BhcmVudChjbGtfZmltYywgcGFyZW50KTsKPiArIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNsa19wdXQoY2xrX2ZpbWMpOwo+ICsgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgfQo+ICsgwqAgwqAgwqAgfQoKVGhlIHNjbGtfZmltYyBjb3VsZCBzb3VyY2UgY2xv
Y2sgZnJvbSBhIG51bWJlciBvZiBvcHRpb25zIG91dCBvZiBhIG11eC4KbW91dF9lcGxsIGlzIGp1
c3Qgb25lIG9mIHRoZW0uIERpZmZlcmVudCBtYWNoaW5lcyBtYXkgd2FudCB0byBzb3VyY2UgdGhl
CmNsb2NrIGRpZmZlcmVudGx5LgpTbywgSU1PIHRoZSBwYXJlbnQgc2VsZWN0aW9uIHNob3VsZCBu
b3QgYmUgZG9uZSBpbiBwbGF0Zm9ybSBjb2RlLCBidXQgcmF0aGVyCmluIG1hY2hpbmUgaW5pdCBj
b2RlLgpOb3QgdGhlIGJlc3QsIGJ1dCBhIGJldHRlciBzb2x1dGlvbiBjYW4gYmUgZm91bmQgaW4K
YXJjaC9hcm0vbWFjaC1zNXBjMTAwL2Rldi1zcGkuYwpHaXZlIGl0IGEgdGhvdWdodC4K
