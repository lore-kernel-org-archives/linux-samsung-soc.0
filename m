From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: exynos4412: porting hdmiddc and hdmiphy node entries
Date: Sun, 27 Apr 2014 02:33:14 +0200
Message-ID: <535C504A.2090809@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040501030006090208000807"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.15]:50885 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752730AbaD0AdX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 26 Apr 2014 20:33:23 -0400
Received: from [192.168.0.34] ([37.201.156.236]) by mail.gmx.com (mrgmx001)
 with ESMTPSA (Nemesis) id 0MTjqS-1WVNKL2dv6-00QP2r for
 <linux-samsung-soc@vger.kernel.org>; Sun, 27 Apr 2014 02:33:21 +0200
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--------------040501030006090208000807
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

I'm trying to get the HDMI port working on a Exynos4412 based board.
Attached is a snippet of a dts. This config was supposed to "work" in
the past.

However with 3.15-rc1 some things changed. samsung,exynos4210-hdmiddc
and samsung,exynos4212-hdmiphy have no function anymore, the code that
previously handled these compatible strings is gone.

So, it looks like that without some patching, HDMI support is atm broken.

I have applied these:
http://www.spinics.net/lists/linux-samsung-soc/msg28161.html
http://www.spinics.net/lists/linux-samsung-soc/msg28259.html

With the first one I can drop a clock from the hdmi node. But then
trouble starts.

So, first of all I'm unsure what the 'hdmiddc' node should be converted
to. Documentation (exynos_hdmi.txt) doesn't help here, since it just
says "phandle to the hdmi ddc node". What kind of 'hdmi ddc node'? From
the code it looks like that it should point to an i2c adapter now. So
should it point to 'i2c_2' now?

The second thing is 'phy', which should be a "phandle to the hdmi ddc
node". Again, no idea what that node should be. Apparantly such nodes
can't be created with current kernel code anyway, primary reason to
apply the simply-phy patches.

OK, so I have to put a simple-phys node in my dts now. Or, wait, do I
just replace the hdmiphy node with a simple-phys node?

Would look something like this:
hdmiphy: simple-phys@38 {
  compatible = "samsung,exynos4412-simple-phy";
  reg = <0x38 0x10000>;
  #phy-cells = <1>;
};

Somehow this doesn't look right. And indeed:
https://patchwork.kernel.org/patch/4021121/

At least for exynos5250 this node is not a child on an i2c adapter.

And yes, I would still have to add 'phys' and 'phy-names' to the hdmi
node. This looks wrong again. Why do I have to specify 'phys' when I
already have 'phy' there? Isn't that redundant?

Well, you see, lots of confusion here. I would appreciate any kind of
help on how to proceed here.

With best wishes,
Tobias

--------------040501030006090208000807
Content-Type: text/plain; charset=UTF-8;
 name="exynos-hdmi-dts.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="exynos-hdmi-dts.txt"

aGRtaSB7Cgljb21wYXRpYmxlID0gInNhbXN1bmcsZXh5bm9zNDIxMi1oZG1pIjsKCXJlZyA9
IDwweDEyRDAwMDAwIDB4MTAwMDAwPjsKCWludGVycnVwdHMgPSA8MCA5MiAwPjsKCWhwZC1n
cGlvID0gPCZncHgzIDcgMD47CgoJY2xvY2tzID0gPCZjbG9jayAyNzE+LCA8JmNsb2NrIDEz
Nj4sIDwmY2xvY2sgMTM5PiwKCQk8JmNsb2NrIDE3OD4sIDwmY2xvY2sgMzk2PjsKCWNsb2Nr
LW5hbWVzID0gImhkbWkiLCAic2Nsa19oZG1pIiwgInNjbGtfcGl4ZWwiLAoJCSJzY2xrX2hk
bWlwaHkiLCAibW91dF9oZG1pIjsKCglwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwoJcGlu
Y3RybC0wID0gPCZoZG1pX2hwZF9pcnE+OwoKCXNhbXN1bmcscG93ZXItZG9tYWluID0gPCZw
ZF90dj47CgoJdmRkX29zYy1zdXBwbHkgPSA8JmxkbzEwX3JlZz47Cgl2ZGRfcGxsLXN1cHBs
eSA9IDwmbGRvOF9yZWc+OwoJdmRkLXN1cHBseSA9IDwmbGRvOF9yZWc+OwoJaGRtaS1lbi1z
dXBwbHkgPSA8JnJlZ19zeXN2ZGQ+OwoKCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJI3NpemUt
Y2VsbHMgPSA8MT47CgoJcGh5LXBvd2VyLWNvbnRyb2wgewoJCXJlZyA9IDwweDEwMDIwNzAw
IDB4MDQ+OwoJfTsKfTsKCmkyY18yOiBpMmNAMTM4ODAwMDAgewoJc3RhdHVzID0gIm9rYXki
OwoJcGluY3RybC0wID0gPCZpMmMyX2J1cz47CglwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQi
OwoKCXNhbXN1bmcsaTJjLXNsYXZlLWFkZHIgPSA8MHgxMD47CglzYW1zdW5nLGkyYy1zZGEt
ZGVsYXkgPSA8MTAwPjsKCXNhbXN1bmcsaTJjLW1heC1idXMtZnJlcSA9IDw0MDAwMDA+OwoK
CWhkbWlkZGNANTAgewoJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3M0MjEwLWhkbWlk
ZGMiOwoJCXJlZyA9IDwweDUwPjsKCX07Cn07CgppMmNfODogaTJjQDEzOGUwMDAwIHsKCXN0
YXR1cyA9ICJva2F5IjsKCglzYW1zdW5nLGkyYy1zbGF2ZS1hZGRyID0gPDB4MTA+OwoJc2Ft
c3VuZyxpMmMtc2RhLWRlbGF5ID0gPDEwMD47CglzYW1zdW5nLGkyYy1tYXgtYnVzLWZyZXEg
PSA8NDAwMDAwPjsKCgljb21wYXRpYmxlID0gInNhbXN1bmcsczNjMjQ0MC1oZG1pcGh5LWky
YyI7CglyZWcgPSA8MHgxMzhFMDAwMCAweDEwMDA+OwoKCWludGVycnVwdHMgPSA8MCA5MyAw
PjsKCgkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCSNzaXplLWNlbGxzID0gPDA+OwoKCWNsb2Nr
cyA9IDwmY2xvY2sgMzI1PjsKCWNsb2NrLW5hbWVzID0gImkyYyI7CgoJaGRtaXBoeUAzOCB7
CgkJY29tcGF0aWJsZSA9ICJzYW1zdW5nLGV4eW5vczQyMTItaGRtaXBoeSI7CgkJcmVnID0g
PDB4Mzg+OwoJfTsKfTsK
--------------040501030006090208000807--
