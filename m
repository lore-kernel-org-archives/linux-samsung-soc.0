From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 04/14] exynos/fimg2d: check buffer space in
 g2d_solid_fill()
Date: Mon, 31 Aug 2015 20:57:23 +0100
Message-ID: <CACvgo51UZ10zQb63yxcUw=7GDp0Zs54atyxJO0xAJeTYzf1GVA@mail.gmail.com>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1440425649-9768-5-git-send-email-tjakobi@math.uni-bielefeld.de>
 <55E45029.40009@samsung.com>
 <55E4AA97.2070502@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <55E4AA97.2070502@math.uni-bielefeld.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, gustavo.padovan@collabora.co.uk, ML dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMzEgQXVndXN0IDIwMTUgYXQgMjA6MjcsIFRvYmlhcyBKYWtvYmkgPHRqYWtvYmlAbWF0aC51
bmktYmllbGVmZWxkLmRlPiB3cm90ZToKPiBIZWxsbyEKPgo+IElua2kgRGFlIHdyb3RlOgo+PiBP
biAyMDE164WEIDA47JuUIDI07J28IDIzOjEzLCBUb2JpYXMgSmFrb2JpIHdyb3RlOgoKPj4+ICsg
ICAgaWYgKGcyZF9jaGVja19zcGFjZShjdHgsIDcsIDEpKQo+Pj4gKyAgICAgICAgICAgIHJldHVy
biAtRU5PU1BDOwo+Pgo+PiBZb3UgY2FuIG1ha2UgMyBhbmQgNCBwYXRjaGVzIHRvIG9uZS4gVGhl
c2Ugc2hvdWxkIGJlIHNhbWUgcGF0Y2guCj4gSG1tLCBzbyB3aGljaCAzIChyZXNwZWN0aXZlbHkg
NCkgcGF0Y2hlcyBzaG91bGQgYmUgc3F1YXNoZWQ/Cj4KSSBiZWxpZXZlIGhlIG1lYW50ICJzcXVh
c2ggdGhlIGludHJvZHVjdGlvbiBvZiB0aGUgZnVuY3Rpb24gYW5kIGl0cwp1c2VzIGludG8gYSBz
aW5nbGUgcGF0Y2giLgoKTm90IHN1cmUgaG93IG11Y2ggdmFsdWUgdGhhdCBicmluZ3MsIHNvIEkn
bGwgbGV0IHlvdSBndXlzIGRlY2lkZSBvbgp0aGUgYmlrZSBzaGVkIGNvbG91ciA6LSkKCi1FbWls
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
