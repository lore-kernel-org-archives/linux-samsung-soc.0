From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v10 00/17] drm/exynos: atomic modesetting support
Date: Wed, 10 Jun 2015 19:59:44 +0900
Message-ID: <557818A0.6080204@samsung.com>
References: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
 <55780B62.1060005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50577 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753849AbbFJK7q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Jun 2015 06:59:46 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NPQ01Q046JLSN30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 10 Jun 2015 19:59:45 +0900 (KST)
In-reply-to: <55780B62.1060005@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andrzej Hajda <a.hajda@samsung.com>

Hi Marek,

On 2015=EB=85=84 06=EC=9B=94 10=EC=9D=BC 19:03, Marek Szyprowski wrote:
> Hello,
>=20
> On 2015-06-01 17:04, Gustavo Padovan wrote:
>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>>
>> Hi,
>>
>> Here goes the full support for atomic modesetting on exynos. I've
>> split the patches in the various phases of atomic support.
>=20
> Thanks for this patchses, however I've noticed a problem after applyi=
ng
> them.
> The issue gets revealed when support for IOMMU is enabled. I've did m=
y
> tests
> with Exynos HDMI driver on Odroid U3 board.
>=20
> To demonstrated the issue I've added following additional debug in th=
e
> exynos
> mixer driver in mixer_graph_buffer() function:
> pr_info("dma addr %pad plane->src_width %d plane->src_height %d\n",
> &plane->dma_addr[0], plane->src_width, plane->src_height);
>=20
> Before applying patches setting 640x480 mode and getting back to 1920=
x1080
> console generates following log:
>=20
> # modetest -M exynos -s 23:640x480
> setting mode 640x480-60Hz@XR24 on connectors 23, crtc 21
> [ 3860.617151] dma 0xbc500000 plane->src_width 640 plane->src_height =
480
> ^C
> [ 3870.555232] dma 0xbbd00000 plane->src_width 1920 plane->src_height=
 1080
> [ 3870.565696] dma 0xbbd00000 plane->src_width 1920 plane->src_height=
 1080
>=20
> After applying atomic modesetting patchset:
> # modetest -M exynos -s 24:640x480
> [  142.540122] dma 0xbbd00000 plane->src_width 1920 plane->src_height=
 1080
> [  142.550726] dma 0xbbd00000 plane->src_width 1920 plane->src_height=
 1080
> setting mode 640x480-60Hz@XR24 on connectors 24, crtc 22
> [  142.643672] dma 0xbc500000 plane->src_width 1920 plane->src_height=
 1080
> [  142.759982] dma 0xbc500000 plane->src_width 640 plane->src_height =
480
> ^C
> [  154.986040] dma 0xbbd00000 plane->src_width 1920 plane->src_height=
 1080
>=20
> As you can see from the above log, mixer_graph_buffer function is cal=
led
> several times. 0xbbd00000 is the DMA address of the 1920x1080 framebu=
ffer
> and 0xbc500000 is the DMA address of the allocated 640x480 buffer.
> mixer_graph_buffer() is first called with the new DMA address of the
> framebuffer, but with the old mode parameters (1920x1080 size) and th=
en
> in the next call it updates the plane parameters to the correct value=
s
> (size changed to 640x480). When IOMMU is not used, this can be easily
> missed, but after enabling IOMMU support, any DMA access to unallocat=
ed
> address causes IOMMU PAGE FAULT. Here it will happen after changing D=
MA
> address of the buffer without changing the size.
>=20
> A quick workaround to resolve this multiple calls to mixer_graph_buff=
er()
> with partially updated mode values is to remove calls to
> mixer_window_suspend/mixer_window_resume from mixer_disable and
> mixer_disable functions, but I expect that this is not the right
> approach.
>=20
> Probably the same problem can be observed with Exynos FIMD driver.
>=20
> Gustavo: could you check if mixer_enable functions should really
> call mixer_window_resume function, which in turn calls mixer_win_comm=
it,
> which calls mixer_graph_buffer with partially updated display buffer
> data?

Marek, can you share how other people can test the atomic feature with
iommu?

I should have merged below several patches and added device tree
relevant codes to test iommu.

1. Merged iommu support patches for Exynos SoC below iommu exynos tree,

https://git.kernel.org/cgit/linux/kernel/git/joro/iommu.git/log/?h=3Dar=
m/exynos

2. Merged below patch,
    [PATCH v7 24/25] ARM: DMA-mapping: add
support for creating reserved mappings in iova space

3. Added device node relevant codes - I tested Exynos drm on trats2
board based on Exynos4412 SoC - like below,
in exynos4.dtsi file:
fimd: fimd@11c00000 {
                 ...
               iommus =3D <&sysmmu_fimd0>;
                 ...

sysmmu_fimd0: sysmmu@11E20000 {
        compatible =3D "samsung,exynos-sysmmu";
        reg =3D <0x11E20000 0x1000>;
        interrupt-parent =3D <&combiner>;
        interrupts =3D <5 2>;
        clock-names =3D "sysmmu", "master";
        clocks =3D <&clock CLK_SMMU_FIMD0>, <&clock CLK_FIMD0>;
         power-domains =3D <&pd_lcd0>;
        #iommu-cells =3D <0>;
};

in exynos4412-trats2.dts file:
fimd@11c00000 {
                status =3D "okay";
                iommu-reserved-mapping =3D <0x40000000 0x40000000 0x400=
00000>;
};

Is that all? You would need to share exact guide about iommu enabling t=
o
other people so that they can test atomic feature with iommu.

Thanks,
Inki Dae

>=20
>> (...)
>=20
> Best regards
