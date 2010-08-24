From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 1/3] h1940: use gpiolib for latch access
Date: Tue, 24 Aug 2010 16:40:21 +0200
Message-ID: <201008241640.21488.marek.vasut@gmail.com>
References: <1282230003-2020-1-git-send-email-anarsoul@gmail.com>
	<201008241549.51513.marek.vasut@gmail.com>
	<201008241704.07384.anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201008241704.07384.anarsoul@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

RG5lIMOadCAyNC4gc3JwbmEgMjAxMCAxNjowNDowMCBWYXNpbHkgS2hvcnV6aGljayBuYXBzYWwo
YSk6Cj4g0JIg0YHQvtC+0LHRidC10L3QuNC4INC+0YIgMjQg0LDQstCz0YPRgdGC0LAgMjAxMCAx
Njo0OTo1MSDQsNCy0YLQvtGAIE1hcmVrIFZhc3V0INC90LDQv9C40YHQsNC7Ogo+ID4gPiArCXJl
dCA9IGdwaW9fcmVxdWVzdChIMTk0MF9MQVRDSF9CTFVFVE9PVEhfUE9XRVIsIGRldl9uYW1lKCZw
ZGV2LQo+ID4KPiA+ZGV2KSk7Cj4gPgo+ID4gVGhpcyBzaG91bGQgY29udGFpbiB0aGUgbmFtZSBv
ZiB0aGUgR1BJTywgbm90IGRldl9uYW1lIEkgYXNzdW1lLgo+IAo+IE9rCj4gCj4gPiA+ICsJaWYg
KHJldCkgewo+ID4gPiArCQlncGlvX2ZyZWUoUzNDMjQxMF9HUEgoMSkpOwo+ID4gCj4gPiBXaGF0
J3MgdGhpcyBjb25zdGFudCAodGhlIDEpIGhlcmUgPyBNYXliZSBzb21lIHNhbmUgI2RlZmluZSB3
b250IGh1cnQgb3IKPiA+IGNvbW1lbnQgYXJvdW5kIGl0Lgo+IAo+IEdQSCgxKSBzcGVjaWZpZXMg
Z3BpbyBiaXQsIHRoYXQncyBub3QgbWFnaWMgY29uc3RhbnQuCgpEZWZpbmluZyBTM0MyNDEwX0dQ
SF9HUElPTkFNRSBmb3IgZWFjaCBiaXQgbWlnaHQgYmUgYmV0dGVyIHRoZW4uCgo+IAo+ID4gPiAr
I2lmbmRlZiBfX0FTU0VNQkxZX18KPiA+ID4gKyNkZWZpbmUgSDE5NDBfTEFUQ0gJCSgodm9pZCBf
X2ZvcmNlIF9faW9tZW0gKikweEY4MDAwMDAwKQo+ID4gPiArI2Vsc2UKPiA+ID4gKyNkZWZpbmUg
SDE5NDBfTEFUQ0gJCTB4RjgwMDAwMDAKPiA+ID4gKyNlbmRpZgo+ID4gCj4gPiBJcyB0aGUgX19B
U1NFTUJMWV9fIHJlYWxseSBuZWVkZWQgPyBZb3UgY2FuIGVzdGFibGlzaCBtYXBwaW5nIHdoZW4g
dGhlCj4gPiBrZXJuZWwgYm9vdHMgKGxvb2tzIGxpa2UgeW91J3JlIGRvaW5nIHRoYXQgYWxyZWFk
eSkgYnV0IHRoZW4gdXNlCj4gPiBfX3Jhd19yZWFkWCBfX3Jhd193cml0ZVggdG8gYWNjZXNzIHRo
YXQgc3BhY2UgaW5zdGVhZCBvZiB0aGlzIHN0dWZmCj4gPiBhYm92ZS4KPiAKPiBVaCwgSSBqdXN0
IG1vdmVkIHRoaXMgY29kZSBmcm9tIGFub3RoZXIgZmlsZSwgbm90IHN1cmUgaWYgX19BU1NFTUJM
WV9fIGlzCj4gbmVjZXNzYXJ5LCBJJ2xsIHJlbW92ZSBpdCBpZiBpdCBpcyBub3QuCgpXZWxsIHRo
aXMgaXNuJ3QgaW5jbHVkZWQgaW4gYW55IGFzc2VtYmx5IGZpbGUuIFNvIGl0J3Mgbm90LiBBbHNv
LCBJJ2QgYmUgaGFwcGllciAKaWYgeW91IGNvdWxkIGZpeCBpdCB0aGUgd2F5IEkgb3V0bGluZWQu
CgpDaGVjayBmb3IgZXhhbXBsZSBtYWNoLXB4YS9iYWxsb29uMy5jIGFuZCBob3cgTkFORCBhY2Nl
c3MgaXMgZG9uZSB0aGVyZS4gQ2hlZXJzCj4gCj4gVGhhbmtzIGZvciByZXZpZXcgOikKCllvdSdy
ZSB3ZWxjb21lLgo+IAo+IFJlZ2FyZHMKPiBWYXNpbHkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cmxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
