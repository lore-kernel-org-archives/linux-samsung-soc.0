From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v5 0/8] arch: arm64: Enable support for Samsung Exynos7 SoC
Date: Mon, 27 Oct 2014 17:47:29 +0100
Message-ID: <544E7721.3040108@samsung.com>
References: <1411361228-18279-1-git-send-email-a.kesavan@samsung.com>
 <541FE357.5090000@gmail.com>
 <CAM4voa=Hsux0+rccSvDJsNTFakZwuwYwjkDkkNFfndFm03Pn3g@mail.gmail.com>
 <542AD2AE.6060109@gmail.com> <01a501cfe1e5$759fc8c0$60df5a40$@kernel.org>
 <CAM4voak5DpRHghgF=EdmPCHeenMFZQeOTsm9QLE1fSXDoM1a+g@mail.gmail.com>
 <CAM4voanMX__N6=q8gg1LEGxqGTtByJXPdj+oAucHoyDh5ybaEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <CAM4voanMX__N6=q8gg1LEGxqGTtByJXPdj+oAucHoyDh5ybaEA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Abhilash,

On 24/10/14 16:32, Abhilash Kesavan wrote:
> On Wed, Oct 8, 2014 at 11:18 AM, Abhilash Kesavan
> <kesavan.abhilash@gmail.com> wrote:
>> On Tue, Oct 7, 2014 at 9:46 AM, Kukjin Kim <kgene@kernel.org> wrote:
>>> Tomasz Figa wrote:
>>>> On 30.09.2014 17:12, Abhilash Kesavan wrote:
>>>>> On Mon, Sep 22, 2014 at 2:22 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>>>>>>
>>>>>> The clock patches look good to me, but since they are doing quite a lot
>>>>>> of code moving I'd prefer to take them through clk tree. Based on the
>>>>>> fact that there are no code dependencies between clock patches and
>>>>>> remaining ones and Exynos7 is a new material for 3.18, I'm inclined to
>>>>>> apply them to my tree if nobody minds.
>>>>>
>>>>> Will you be picking up the clock changes soon ?
>>>>
>>>> I'd like to do so. Kukjin, since clock changes are a part of this
>>>> series, might I have your Ack for them to be applied separately?
>>>>
>>> Sure, I'm fine so please go ahead with my ack on the changes.
>>>
>>> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
>>>
>>> Thanks for your asking.
>>
>> Can you please pick up the clock changes now that Kukjin has ack'ed it.
> 
> Sylwester, you mentioned in another thread that Tomasz might not be
> available for the next few days. Could you please consider applying
> the clock changes in this series to samsung clk-next if they look OK ?
> 
> Please take a look at clock changes at
> http://www.spinics.net/lists/arm-kernel/msg370673.html too.

I've picked up patches from the $subject series.  But please see my
comment the the second series you've pointed out with the link above.
If you decide to rearrange changes to exynos7-clk.h header file among
those two series I will drop that 4 patches.  Perhaps you could gather
all pending exynos7 clk patches, fix any issues and send to me in one
series ?
I'd like to avoid modifying indices assigned to specific clocks in
subsequent patches, DT binding should be defined in advance and ideally
be specifying exact indices for each possible clock.

--
Thanks,
Sylwester
