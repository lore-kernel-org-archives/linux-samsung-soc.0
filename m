From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: Re: [PATCH v9 0/2] Adds PMU and S2R support for exynos5420
Date: Wed, 8 Oct 2014 17:36:28 +0545
Message-ID: <CAGm_ybj1DWituTMvG77+=8XY57skoLk+OwS_YLL0FXhrCOkohA@mail.gmail.com>
References: <1412673723-15551-1-git-send-email-vikas.sajjan@samsung.com>
 <CAGm_ybjP1WQfbyWR5GwQ6QnUjsy4qB_678+L=jgmMzz-rWkb0w@mail.gmail.com>
 <016401cfe2d3$23f3f0c0$6bdbd240$@kernel.org>
 <CAGm_ybiZQgok1oa3aar0ymgfu8KUn1j3LLqHiwQ81Mnh8zVHXQ@mail.gmail.com>
 <CABxcv=k==kP_+fc58a6ji_O572Cxzj_EmxmRo3kbc48k-qBO-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABxcv=k==kP_+fc58a6ji_O572Cxzj_EmxmRo3kbc48k-qBO-w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, sunil joshi <joshi@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Javier,

On Wed, Oct 8, 2014 at 3:42 PM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
> Hello Vikas,
>
> On Wed, Oct 8, 2014 at 11:26 AM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
>>>>
>>>> Can you please pick this series.
>>>>
>>> Yes, sure I will queue this series after -rc1 release.
>>
>
> Not related to your series but did you figure out why the
> aclk200_disp1 and aclk300_disp1 clocks are left unused?
>

As mentioned earlier, I recently noticed that these clocks are
preventing system from suspending.
These clocks are used by the in-flight DRM display driver and once it
is merged the display driver will be handling the clock during boot-up
and suspend/resume.

In our internal tree (3.17-rc5 based) where we have DRM display driver
enabled, we do not see any issues and do not need to add the
CLK_IGNORE_UNUSED flag.

> I'm carrying your patch to flag those clocks as CLK_IGNORE_UNUSED to
> prevent being disabled by the CCF. And while that allows me to test,
> I'm afraid that it may not be the proper solution since it could just
> be hiding the real cause of the issue.

Till the DRM display driver gets merged, we can continue to use this
for testing purposes.

>
> Of course this should not block your series from been merged but I
> just wondered if you found the cause since it would be nice to have
> s2r properly working on exynos5420.


>
>> Thank you.
>>
>>>
>>> Thanks,
>>> Kukjin
>>>
>
> best regards,
> Javier
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
