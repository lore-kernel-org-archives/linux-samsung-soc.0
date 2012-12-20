From: Subash Patel <subashrp@gmail.com>
Subject: Re: [PATCH] ARM: dts: fix split memory bank for SSDK5440
Date: Thu, 20 Dec 2012 14:19:48 -0800
Message-ID: <50D38F04.8020307@gmail.com>
References: <1356030217-5472-1-git-send-email-kgene.kim@samsung.com>
 <CAOesGMg03Yn=fDr1XqmbBUs=eZO0_8=iti1LUiJ6CX5n1Bm45g@mail.gmail.com>
 <1464138.NEt7mMkYJc@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1464138.NEt7mMkYJc@flatron>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

I would like to ask a question here. Do we need to have sparse even if 
the physical memory is contiguous? All the recent exynos machines come 
with physical banks without any holes, and I am thinking why not drop it 
and use flat mem instead. With LPAE these sections sizes wont be useful, 
and I dont like to keep different section sizes for different 
configurations. Any suggestions/opinions are very much helpful to me.

Regards,
Subash

On Thursday 20 December 2012 01:14 PM, Tomasz Figa wrote:
> Hi Olof,
>
> On Thursday 20 of December 2012 11:56:59 Olof Johansson wrote:
>> Hi,
>>
>> On Thu, Dec 20, 2012 at 11:03 AM, Kukjin Kim <kgene.kim@samsung.com>
> wrote:
>>> The size of memory bank should be under 256MB, because current
>>> section size is 256MB on EXYNOS SoCs. This patch fixes it.
>>
>> This makes no sense. You don't have to split up memory ranges, the
>> code should be made to handle it instead.
>
> It's not Exynos code which causes the problem. Sparsemem initialization
> relies on the fact that initial amount of structures to described memory
> equals to maximum section size which is defined per arch (e.g.
> ARCH_EXYNOS).
>
>> What's the actual bug caused by this? The description is vague.
>
> The kernel panics early on NULL pointer dereference in memory
> initialization.
>
> Best regards,
> Tomasz Figa
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
