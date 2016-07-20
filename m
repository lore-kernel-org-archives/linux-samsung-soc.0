From: Marian Mihailescu <mihailescu2m@gmail.com>
Subject: Re: Odroid U2 Kernel 4.7rc7+ Hang on reboot
Date: Wed, 20 Jul 2016 23:56:13 +0000 (UTC)
Message-ID: <loom.20160721T015558-545@post.gmane.org>
References: <1468525055.4843.4.camel@ndufresne.ca> <1468525558.4843.6.camel@ndufresne.ca> <5787EF8E.2010401@math.uni-bielefeld.de> <1468528408.4843.9.camel@ndufresne.ca> <578896DB.7060708@samsung.com> <5788CA67.5090200@samsung.com> <5788E1EB.4030003@math.uni-bielefeld.de> <5788E31D.6010606@samsung.com> <5788E3CB.5080103@math.uni-bielefeld.de> <5788E457.6060202@samsung.com> <5788F449.6060202@math.uni-bielefeld.de> <1468598213.3819.2.camel@ndufresne.ca> <578E0F28.6010600@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:46074 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751028AbcGTX4X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jul 2016 19:56:23 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1bQ1Lf-0007Ha-IV
	for linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2016 01:56:20 +0200
Received: from sprocket.trc.adelaide.edu.au ([129.127.12.119])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Jul 2016 01:56:19 +0200
Received: from mihailescu2m by sprocket.trc.adelaide.edu.au with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Jul 2016 01:56:19 +0200
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

S3J6eXN6dG9mIEtvemxvd3NraSA8ay5rb3psb3dza2kgPGF0PiBzYW1zdW5nLmNvbT4gd3JpdGVzOgoKPiAKPiBPbiAwNy8xNS8yMDE2IDA1OjU2IFBNLCBOaWNvbGFzIER1ZnJlc25lIHdyb3RlOgo+ID4gTGUgdmVuZHJlZGkgMTUganVpbGxldCAyMDE2IMOgIDE2OjMzICswMjAwLCBUb2JpYXMgSmFrb2JpIGEgw6ljcml0IDoKPiA+PiBJIGNhbiBjb25maXJtIHRoYXQgdGhpcyBpbmRlZWQgZG9lc24ndCB3b3JrLgo+ID4+Cj4gPj4gY2hpZG9yaSB+ICMgZWNobyAxID4gL3Byb2Mvc3lzL2tlcm5lbC9zeXNycQo+ID4+IGNoaWRvcmkgfiAjIGVjaG8gcyA+IC9wcm9jL3N5c3JxLXRyaWdnZXIKPiA+PiBjaGlkb3JpIH4gIyBlY2hvIHUgPiAvcHJvYy9zeXNycS10cmlnZ2VyCj4gPj4gY2hpZG9yaSB+ICMgZWNobyBiID4gL3Byb2Mvc3lzcnEtdHJpZ2dlcgo+ID4+IDxib2FyZCBoYW5ncywgb25seSByZWQgcG93ZXIgTEVEIG9uPgo+ID4+Cj4gPj4gSSBndWVzcyBOaWNvbGFzIGlzIHNlZWluZyBhIGRpZmZlcmVudCBvciBhbm90aGVyIHByb2JsZW0gaGVyZSAKdGhvdWdoLgo+ID4gCj4gPiBXZWxsIGZvciBtZSBib3RoIG1ldGhvZCBoYW5ncy4gT24gYW4gZXh0
 cmEgbm90ZSwgcmVzZXQgaW5zaWRlIFVib290Cj4gPiB3b3JrcywgYnV0IHJlYm9vdCBpbiBMaW51eCBoYW5nLiBJIHRyaWVkIGFkZGluZyBhIHRyYWNlCj4gPiBpbiBzeXNjb25fcmVzdGFydF9oYW5kbGUoKSwgYnV0IHRoZSB0cmFjZSBpcyBuZXZlciBkaXNwbGF5ZWQuIEknbQo+ID4gd29uZGVyaW5nIGlmIHRoYXQgaGFuZGxlciBpcyBldmVyIGNhbGxlZCwgb3IgaWYgaXQncyBqdXN0IHRoYXQgdGhlCj4gPiBzZXJpYWwgY29uc29sZSB3YXMgc2h1dCBkb3duIGFscmVhZHkuCj4gPiAKPiA+IEFueSBpZGVhIHdoYXQgZWxzZSBzaG91bGQgSSB0cmFjZSA/Cj4gCj4gVGhpcyBpcyB3ZWlyZC4uLiByZWJvb3Qgc2hvdWxkIHdvcmsuIEp1c3QgdG8gY29uZmlybSBpdCAtIGNhbiB5b3UgdGVzdAo+IGZvbGxvd2luZyBwYXRjaCBpbiBib3RoIHNjZW5hcmlvcyAodGhpcyBzaG91bGQgZml4IGJvdGggb2YgdGhlbS4uLiBhdAo+IGxlYXN0IG9uIE9kcm9pZCBVMyBidXQgeW91ciBib2FyZCBtaWdodCBoYXZlIGRpZmZlcmVudCBTUEwvQkwxKToKPiAKCkhpIEtyenlzenRvZiwKClRoYW5rcyBmb3IgbG9va2luZyBpbnRvIHRoaXMuCldoaWxlIE5pY29sYXMgaXMgYX
 dheSwgSSBjYW4gZG8gd2hhdGV2ZXIgdGVzdGluZyB5b3UgbmVlZC4KSSBjYW4gY29uZmlybSB0aGF0IHdpdGggdGhpcyBwYXRjaCwgSSBjYW4gbm93IHJlYm9vdCBib3RoIGZyb20gdHR5MSBhbmQgCnR0eVNBQzEuIEkgaGF2ZW4ndCBkb25lIGFueSBleHRlbnNpdmUgdGVzdGluZywgYnV0IEkgY291bGQgcmVib290IAp3aXRob3V0IGlzc3VlcyBzZXZlcmFsIHRpbWVzIGluIGEgcm93LgoKSSBkbyByZW1lbWJlciB3aXRoIHByZXZpb3VzIGtlcm5lbHMgKGV2ZW4gMy54KSB0aGVyZSB3b3VsZCBiZSBpc3N1ZXMgCndpdGggcmVib290IGlmIHRoZSBnb3Zlcm5vciB3YXMgYW55dGhpbmcgZWxzZSB0aGFuIHBlcmZvcm1hbmNlLiBUaGlzIGlzIAp3aHkgbXkgY29uZmlnIG9ubHkgaGFzIHBlcmZvcm1hbmNlIGVuYWJsZWQgLSBidXQgSSB3YXMgc3RpbGwgaGF2aW5nIApyZWJvb3QgaXNzdWVzLiBEbyB5b3UgZXhwZWN0IHVzaW5nIHBlcmZvcm1hbmNlIGdvdiArIHRoaXMgcGF0Y2ggdG8gZnVsbHkgCnNvbHZlIHRoZSByZWJvb3QgaXNzdWU/CgpUaGFua3MsCk1hcmlhbgoK
