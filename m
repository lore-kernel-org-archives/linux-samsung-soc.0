From: KyongHo Cho <pullip.cho@samsung.com>
Subject: Re: [PATCH v2 2/5] ARM: S5P: Remove system MMU driver from
	arm/plat-s5p
Date: Sat, 1 Oct 2011 08:50:51 +0900
Message-ID: <CAHQjnOPVReT3Lk7_Mk864Z8fPVC1dMRCoXmr1tHuBvxspYBGiw@mail.gmail.com>
References: <016d01cc7f42$e58a0aa0$b09e1fe0$%kim@samsung.com>
	<20110930134243.GR2138@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110930134243.GR2138@amd.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Roedel, Joerg" <Joerg.Roedel@amd.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "younglak1004.kim@samsung.com" <younglak1004.kim@samsung.com>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Sanghyun Lee <sanghyun75.lee@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Sep 30, 2011 at 10:42 PM, Roedel, Joerg <Joerg.Roedel@amd.com> wrot=
e:
> On Fri, Sep 30, 2011 at 03:30:57AM -0400, Kukjin Kim wrote:
>> From: KyongHo Cho <pullip.cho@samsung.com>
>>
>> Due to Ohad Ben-Cohen gathered IOMMU drivers in drivers/iommu directory,
>> System MMU driver is moved to drivers/iommu directory and removed
>> from arch/arm/plat-s5p directory.
>>
>> Please see
>> https://lkml.org/lkml/2011/6/8/69
>>
>> Signed-off-by: KyongHo Cho <pullip.cho@samsung.com>
>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> ---
>> =A0arch/arm/plat-s5p/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A08 -
>> =A0arch/arm/plat-s5p/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A01 -
>> =A0arch/arm/plat-s5p/include/plat/sysmmu.h | =A0 95 ----------
>> =A0arch/arm/plat-s5p/sysmmu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0312 ------=
-------------------------
>
> You can use 'git mv' to just move the file. This ensures bisectability
> of your patches. No need to delete the code in one patch and re-add it
> in the next one (which breaks bisectability).
>
Thanks.
I will do that

Regards,
KyongHo.
