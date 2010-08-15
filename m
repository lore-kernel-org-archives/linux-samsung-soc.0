From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 3/3] ARM: S3C64XX: Stop and flush requests on freeing
Date: Sun, 15 Aug 2010 22:28:41 +0900
Message-ID: <AANLkTimvW3KM6k5grpXXoZw1Z64J1OtZkqpCavPApbsn@mail.gmail.com>
References: <4c67e6b3.487e0e0a.0a1b.22d7@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4c67e6b3.487e0e0a.0a1b.22d7@mx.google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maurus Cuelenaere <mcuelenaere@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gTW9uLCBNYXkgMzEsIDIwMTAgYXQgODozNCBQTSwgTWF1cnVzIEN1ZWxlbmFlcmUKPG1jdWVs
ZW5hZXJlQGdtYWlsLmNvbT4gd3JvdGU6Cj4gV2hlbiBhIERNQSBjaGFubmVsIGlzIGZyZWVkLCBp
dHMgcGVuZGluZyByZXF1ZXN0cyBzaG91bGQgYmUgZmx1c2hlZCBhbmQgdGhlCj4gY2hhbm5lbCBz
aG91bGQgYmUgaGFsdGVkLiBUaGlzIHBhdGNoIGVuc3VyZXMgdGhhdCBoYXBwZW5zLgo+Cj4gU2ln
bmVkLW9mZi1ieTogTWF1cnVzIEN1ZWxlbmFlcmUgPG1jdWVsZW5hZXJlQGdtYWlsLmNvbT4KPiAt
LS0KPiDCoGFyY2gvYXJtL21hY2gtczNjNjR4eC9kbWEuYyB8IMKgIMKgMyArKy0KPiDCoDEgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL21hY2gtczNjNjR4eC9kbWEuYyBiL2FyY2gvYXJtL21hY2gtczNjNjR4eC9k
bWEuYwo+IGluZGV4IDFmZDlkMGMuLmUxZjIyYWYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vbWFj
aC1zM2M2NHh4L2RtYS5jCj4gKysrIGIvYXJjaC9hcm0vbWFjaC1zM2M2NHh4L2RtYS5jCj4gQEAg
LTU2MCw3ICs1NjAsOCBAQCBpbnQgczNjMjQxMF9kbWFfZnJlZSh1bnNpZ25lZCBpbnQgY2hhbm5l
bCwgc3RydWN0IHMzYzI0MTBfZG1hX2NsaWVudCAqY2xpZW50KQo+IMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGNoYW5uZWwsIGNoYW4tPmNsaWVudCwgY2xpZW50KTsKPiDCoCDCoCDC
oCDCoH0KPgo+IC0gwqAgwqAgwqAgLyogc29ydCBvdXQgc3RvcHBpbmcgYW5kIGZyZWVpbmcgdGhl
IGNoYW5uZWwgKi8KPiArIMKgIMKgIMKgIHMzYzY0eHhfZG1hX2ZsdXNoKGNoYW4pOwo+ICsgwqAg
wqAgwqAgczNjNjR4eF9kbWFfc3RvcChjaGFuKTsKCkkgdGhpbmssIHRoZSBvcmRlciBzaG91bGQg
YmUgcmV2ZXJ0ZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCg==
