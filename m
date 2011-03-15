From: InKi Dae <daeinki@gmail.com>
Subject: Re: [PATCH 3/7] ARM: Samsung: update/rewrite Samsung SYSMMU (IOMMU) driver
Date: Tue, 15 Mar 2011 10:45:50 +0900
Message-ID: <AANLkTinzBvkcB111UZd2rJ9raaXkh2TqmTw5Y+4WFd48@mail.gmail.com>
References: <1299229274-9753-4-git-send-email-m.szyprowski@samsung.com>
	<201103111615.01829.arnd@arndb.de>
	<000201cbe002$768d9de0$63a8d9a0$%szyprowski@samsung.com>
	<201103111700.17373.arnd@arndb.de>
	<AANLkTimagS1vBXEYjXQDx=OGhTRm=n0yO4n+kHTAqBOz@mail.gmail.com>
	<20110314124652.GF26085@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20110314124652.GF26085@n2100.arm.linux.org.uk>
Sender: linux-media-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: KyongHo Cho <pullip.cho@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, k.debski@samsung.com, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, =?EUC-KR?B?sK25zrHU?= <mk7.kang@samsung.com>, linux-kernel@vger.kernel.org, =?EUC-KR?B?tOvAzrHi?= <inki.dae@samsung.com>, kyungmin.park@samsung.com, kgene.kim@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

2011/3/14 Russell King - ARM Linux <linux@arm.linux.org.uk>:
> On Mon, Mar 14, 2011 at 09:37:51PM +0900, KyongHo Cho wrote:
>> I have also noticed that dma_map_single/page/sg() can map physical
>> memory into an arbitrary device address region.
>> But it is not enough solution for various kinds of IOMMUs.
>> As Kukjin Kim addressed, we need to support larger page size than 4K=
B
>> because we can reduce TLB miss when we have larger page size.
>>
>> Our IOMMU(system mmu) supports all page size of ARM architecture
>> including 16MB, 1MB, 64KB and 4KB.
>> Since the largest size supported by buddy system of 32-bit architect=
ure is 4MB,
>> our system support all page sizes except 16MB.
>> We proved that larger page size is helpful for DMA performance
>> significantly (more than 10%, approximately).
>> Big page size is not a problem for peripheral devices
>> because their address space is not suffer from external fragmentatio=
n.
>
> 1. dma_map_single() et.al. is used for mapping *system* *RAM* for dev=
ices
> =A0 using whatever is necessary. =A0It must not be used for trying to=
 setup
> =A0 arbitary other mappings.
>
> 2. It doesn't matter where the memory for dma_map_single() et.al. com=
es
> =A0 from provided the virtual address is a valid system RAM address o=
r
> =A0 the struct page * is a valid struct page in the memory map (iow, =
you
> =A0 can't create this yourself.)

You mean that we cannot have arbitrary virtual address mapping for
iommu based device?
actually, we have memory mapping to arbitrary device virtual address
space, not kernel virtual address space.

>
> 3. In the case of an IOMMU, the DMA API does not limit you to only us=
ing
> =A0 4K pages to setup the IOMMU mappings. =A0You can use whatever you=
 like
> =A0 provided the hardware can cope with it. =A0You can coalesce sever=
al
> =A0 existing entries together provided you track what you're doing an=
d can
> =A0 undo what's been done when the mapping is no longer required.
>
> So really there's no reason not to use 64K, 1M and 16M IOMMU entries =
if
> that's the size of buffer which has been passed to the DMA API.
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
