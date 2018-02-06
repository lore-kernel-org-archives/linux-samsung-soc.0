From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/4] tree-wide: fix comparison to bitshift when dealing
 with a mask
Date: Tue, 6 Feb 2018 09:20:43 +0100
Message-ID: <CAMuHMdWnV17DCxr71k6n3w+5jPtQmeuPugr58xadq9U_qchJnQ@mail.gmail.com>
References: <20180205201002.23621-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180205201002.23621-1-wsa+renesas@sang-engineering.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-samsung-soc@vger.kernel.org, netdev <netdev@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Dan Carpenter <dan.carpenter@oracle.com>, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgV29sZnJhbSwKCk9uIE1vbiwgRmViIDUsIDIwMTggYXQgOTowOSBQTSwgV29sZnJhbSBTYW5n
Cjx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4gSW4gb25lIFJlbmVz
YXMgZHJpdmVyLCBJIGZvdW5kIGEgdHlwbyB3aGljaCB0dXJuZWQgYW4gaW50ZW5kZWQgYml0IHNo
aWZ0ICgnPDwnKQo+IGludG8gYSBjb21wYXJpc29uICgnPCcpLiBCZWNhdXNlIHRoaXMgaXMgYSBz
dWJ0bGUgaXNzdWUsIEkgbG9va2VkIHRyZWUgd2lkZSBmb3IKPiBzaW1pbGFyIHBhdHRlcm5zLiBU
aGlzIHNtYWxsIHBhdGNoIHNlcmllcyBpcyB0aGUgb3V0Y29tZS4KPgo+IEJ1aWxkYm90IGFuZCBj
aGVja3BhdGNoIGFyZSBoYXBweS4gT25seSBjb21waWxlLXRlc3RlZC4gVG8gYmUgYXBwbGllZAo+
IGluZGl2aWR1YWxseSBwZXIgc3ViLXN5c3RlbSwgSSB0aGluay4gSSdkIHRoaW5rIG9ubHkgdGhl
IG5ldDogYW1kOiBwYXRjaCBuZWVkcwo+IHRvIGJlIGNvbmlzZGVyZWQgZm9yIHN0YWJsZSwgYnV0
IEkgbGVhdmUgdGhpcyB0byBwZW9wbGUgd2hvIGFjdHVhbGx5IGtub3cgdGhpcwo+IGRyaXZlci4K
Pgo+IENDaW5nIERhbi4gTWF5YmUgaGUgaGFzIGFuIGlkZWEgaG93IHRvIGFkZCBhIHRlc3QgdG8g
c21hdGNoPyBJbiBteSBzZXR1cCwgb25seQo+IGNwcGNoZWNrIHJlcG9ydGVkIGEgJ2NvZGluZyBz
dHlsZScgaXNzdWUgd2l0aCBhIGxvdyBwcmlvLgoKSSBmb3VuZCB0d28gbW9yZSB1c2luZyAiZ2l0
IGdyZXAgJ2RlZmluZS4qMHhbMC05YS1mXSogPCAnIjoKCmRyaXZlcnMvbmV0L2Nhbi9tX2Nhbi9t
X2Nhbi5jOiNkZWZpbmUgUlhGQ19GV01fTUFTSyAgICAgKDB4N2YgPCBSWEZDX0ZXTV9TSElGVCkK
ZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9nb2t1X3VkYy5oOiNkZWZpbmUgSU5UX0VQbk5BSyhuKQoo
MHgwMDEwMCA8IChuKSkgICAgICAgICAvKiAwIDwgbiA8IDQgKi8KCkdye29ldGplLGVldGluZ31z
LAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5v
cmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJ
IGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
