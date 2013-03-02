From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: Boot failure on Origen board using latest kernel
Date: Sat, 2 Mar 2013 11:06:41 +0530
Message-ID: <CAGOxZ51roe7id29h-v3cgMQssYscQYy_iWJJ1BgAywu999V79g@mail.gmail.com>
References: <CAK9yfHw7-LJx31poPqxn_GRfEDyfReqeYTPX7Fqwzi7vtC98UQ@mail.gmail.com>
 <CAGOxZ51EuXnncDf=N7yJ1HR3GgE29Q+oLu-UQGEU0STr1m05AA@mail.gmail.com> <CAK9yfHzAVhW7RNqiq3sM97PxTjYJe4UJG6cJaGHv9+smPWedGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK9yfHzAVhW7RNqiq3sM97PxTjYJe4UJG6cJaGHv9+smPWedGg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "Koul, Vinod" <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Mar 2, 2013 at 10:26 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Hi Alim,
>
> On 2 March 2013 10:18, Alim Akhtar <alim.akhtar@gmail.com> wrote:
>> Hi Sachin,
>>
>> Looks like exynos4 is not yet moved to the generic dma binding recently
>> merged.
>>
>> Could you try out below:
>
> I forgot to mention in the previous mail that the problem was in non-dt case.
> With the below entries added in exynos4 dtsi file, it boots fine in DT case.
>

Aha, I understand.
But I think the current mainline kernel is broken for __DT case__ also
for exynos4 and that is what my suggested patch fix.
Thanks for you confirmation.

> --
> With warm regards,
> Sachin

--
Regards,
Alim
