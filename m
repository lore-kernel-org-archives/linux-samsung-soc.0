From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 4/4] S3C64XX DSP: Added the CPU driver for PCM controllers
Date: Tue, 3 Nov 2009 15:59:46 +0900
Message-ID: <1b68c6790911022259v2e4448eav9459384f164a7236@mail.gmail.com>
References: <1257127791-5595-1-git-send-email-jassisinghbrar@gmail.com>
	 <1257127791-5595-2-git-send-email-jassisinghbrar@gmail.com>
	 <1257127791-5595-3-git-send-email-jassisinghbrar@gmail.com>
	 <1257127791-5595-4-git-send-email-jassisinghbrar@gmail.com>
	 <20091102111753.GB29351@sirena.org.uk>
	 <20091102113932.GB23772@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f42.google.com ([209.85.160.42]:59286 "EHLO
	mail-pw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751010AbZKCG7m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Nov 2009 01:59:42 -0500
Received: by pwj9 with SMTP id 9so2335153pwj.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Nov 2009 22:59:47 -0800 (PST)
In-Reply-To: <20091102113932.GB23772@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben@trinity.fluff.org>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

T24gTW9uLCBOb3YgMiwgMjAwOSBhdCA4OjM5IFBNLCBCZW4gRG9va3MgPGJlbkB0cmluaXR5LmZs
dWZmLm9yZz4gd3JvdGU6Cj4KPj4gPiArIMKgIGRhaS0+cHJpdmF0ZV9kYXRhID0gZHNwOwo+PiA+
ICsKPj4gPiArIMKgIGlmICghYmFzZSkgewo+PiA+ICsgwqAgwqAgwqAgwqAgwqAgc3RydWN0IHJl
c291cmNlICpyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwKPj4gPiArIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgSU9SRVNPVVJDRV9NRU0sCj4+ID4gKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoDApOwo+PiA+ICsgwqAgwqAgwqAgwqAgwqAgaWYgKCFyZXMpIHsKPj4gPiArIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRldl9lcnIoZGV2LCAiVW5hYmxlIHRvIGdldCByZWdp
c3RlciByZXNvdXJjZVxuIik7Cj4+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1
cm4gLUVOWElPOwo+PiA+ICsgwqAgwqAgwqAgwqAgwqAgfQo+PiA+ICsKPj4gPiArIMKgIMKgIMKg
IMKgIMKgIGlmICghcmVxdWVzdF9tZW1fcmVnaW9uKHJlcy0+c3RhcnQsIHJlc291cmNlX3NpemUo
cmVzKSwKPj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgICJzM2M2NHh4LWRzcCIpKSB7Cj4+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBkZXZfZXJyKGRldiwgIlVuYWJsZSB0byByZXF1ZXN0IHJlZ2lzdGVyIHJlZ2lvblxuIik7Cj4+
ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gLUVCVVNZOwo+PiA+ICsgwqAg
wqAgwqAgwqAgwqAgfQo+PiA+ICsKPj4gPiArIMKgIMKgIMKgIMKgIMKgIGJhc2UgPSByZXMtPnN0
YXJ0Owo+PiA+ICsgwqAgfQo+Cj4gSSB3b3VsZCBsaWtlIHRvIHNlZSBwbGF0Zm9ybV9kZXZpY2Vz
IHdpdGggdGhlaXIgcHJvcGVyIHJlc291cmNlcyBiZWluZwo+IG1hbmRhdG9yeSBmb3IgbmV3IGRy
aXZlcnMuIFdlIGNvdWxkIGRvIHdpdGggdGhpcyBsb3QgcHJvcGxlcmx5IGZvbGxvd2luZwo+IHRo
ZSBkZXZpY2UgZHJpdmVyIG1vZGVsLgpzb3JyeSwgaSBkaWRuJ3QgZ2V0IGl0LiBjb3VsZCB1IHBs
ZWFzZSBjbGFyaWZ5IG1vcmU/CgoKPj4gPiArLyogTW9kdWxlIGluZm9ybWF0aW9uICovCj4+ID4g
K01PRFVMRV9BVVRIT1IoIkphc3dpbmRlciBTaW5naCwgPGphc3NpLmJyYXJAc2Ftc3VuZy5jb20+
Iik7Cj4+ID4gK01PRFVMRV9ERVNDUklQVElPTigiUzNDNjRYWCBQQ00gQ29udHJvbGxlciBEcml2
ZXIiKTsKPgo+IG5vIG1vZHVsZSBsaWNlbnNlLgpJIG1pc3NlZCB0aGF0LCB3aWxsIGFkZC4gdGhh
bmtzLgoKPgo+IC0tCj4gQmVuCj4KPiBROiDCoCDCoCDCoFdoYXQncyBhIGxpZ2h0LXllYXI/Cj4g
QTogwqAgwqAgwqBPbmUtdGhpcmQgbGVzcyBjYWxvcmllcyB0aGFuIGEgcmVndWxhciB5ZWFyLgo+
Cj4K
