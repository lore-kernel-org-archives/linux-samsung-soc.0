From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH 1/2] host: ehci-exynos: Convert to use the
 SET_SYSTEM_SLEEP_PM_OPS
Date: Mon, 10 Oct 2016 00:31:16 +0530
Message-ID: <CANAwSgRGTL0HEZ1M9AVN45gmQdyvMcidY68nNb-zONSBVKGdcA@mail.gmail.com>
References: <1476023655-3232-1-git-send-email-linux.amoon@gmail.com>
 <20161009163446.GA9672@kozik-lap>
 <CANAwSgSr6-0x47=0P_NCiGCv=FSZR9dNT89JpY=9R_32U8HywQ@mail.gmail.com>
 <20161009172757.GA11916@kozik-lap>
 <CANAwSgS9tbhPK4jwoqR6G1=iKAo15H3Dizu3Lp03KMGbQ4aj9A@mail.gmail.com>
 <20161009183933.GA15270@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161009183933.GA15270@kozik-lap>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

hi Krzysztof,

On 10 October 2016 at 00:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Sun, Oct 09, 2016 at 11:57:59PM +0530, Anand Moon wrote:
>> hi Krzysztof,
>>
>> On 9 October 2016 at 22:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> > On Sun, Oct 09, 2016 at 10:45:40PM +0530, Anand Moon wrote:
>> >> Hi Krzysztof,
>> >>
>> >> On 9 October 2016 at 22:04, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> >> > On Sun, Oct 09, 2016 at 02:34:14PM +0000, Anand Moon wrote:
>> >> >> Move the ehci-exynos system PM callbacks within #ifdef CONFIG_PM_SLEEP
>> >> >> as to avoid them being build when not used. This also allows us to use the
>> >> >> SET_SYSTEM_SLEEP_PM_OPS macro which simplifies the code.
>> >> >>
>> >> >> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>> >> >> ---
>> >> >>  drivers/usb/host/ehci-exynos.c | 14 ++++++--------
>> >> >>  1 file changed, 6 insertions(+), 8 deletions(-)
>> >> >>
>> >> >> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
>> >> >> index 42e5b66..1899900 100644
>> >> >> --- a/drivers/usb/host/ehci-exynos.c
>> >> >> +++ b/drivers/usb/host/ehci-exynos.c
>> >> >> @@ -251,7 +251,7 @@ static int exynos_ehci_remove(struct platform_device *pdev)
>> >> >>       return 0;
>> >> >>  }
>> >> >>
>> >> >> -#ifdef CONFIG_PM
>> >> >> +#ifdef CONFIG_PM_SLEEP
>> >> >
>> >> > Does not look like an equivalent change. How will it behave in a config
>> >> > with !SUSPEND && !HIBERNATE && PM?
>> >> >
>> >>
>> >> [snip]
>> >>
>> >> I just wanted to update suspend and resume callback to use
>> >> SET_SYSTEM_SLEEP_PM_OPS
>> >> as they are define under CONFIG_PM_SLEEP so I update above to avoid
>> >> compilation warning/error.
>> >
>> Apologize: for not understanding your question.
>>
>> > First of all you did not answer to my question, so let me rephrase into
>> > two:
>> > 1. Is the code equivalent?
>>
>> No CONFIG_PM and CONFIG_PM_SLEEP are different options.
>> But I could not disable CONFIG_PM_SLEEP option with either in exynos_defconfig
>
> So the code is not equivalent...
>
>>
>> CONFIG_PM_SLEEP=n or
>> # CONFIG_PM_SLEEP is not set
>>
>> > 2. What will be the output with !SUSPEND && !HIBERNATE && PM?
>>
>> #
>> # Power management options
>> #
>> # CONFIG_SUSPEND is not set
>> # CONFIG_HIBERNATION is not set
>> # CONFIG_PM is not set
>>
>> When CONFIG_SUSPEND and CONFIG_HIBERNATION are not set
>> CONFIG_PM is disabled and so is CONFIG_PM_SLEEP.
>
> In my config, the CONFIG_PM was enabled thus the code changes the
> functionality... Maybe this was intented but I really don't get it from
> the commit message or from your explanations here.
>
> Krzysztof

Ok I will keep the changes to use CONFIG_PM,
but use the SET_SYSTEM_SLEEP_PM_OPS option in V2 patch.
Is that ok.

-Best Regards
-Anand Moon
