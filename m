From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [RESEND PATCH V5 01/12] drm/exynos: Move DP setup out of hotplug
 workqueue
Date: Wed, 23 Jul 2014 20:48:30 +0530
Message-ID: <CAEC9eQMuTva-6tMCOd2KvRgca8MgKqhOLQrWpVdzHYCkd-g3aQ@mail.gmail.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
 <1405629839-12086-2-git-send-email-ajaykumar.rs@samsung.com>
 <CAOw6vbKeUCoWutYS3ZpFdu6aKXGPyQVvBe_PbGgmTMZHGvjc=w@mail.gmail.com>
 <CAEC9eQNfFzzGiAcs_UXtTwUiRF9VMa+naWHpB3H+SNjWFk9Ecg@mail.gmail.com>
 <CAOw6vbLuV8_H3DsOwL8vvu2kqTjnpEa_7kuAiikaACD3pedtEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAOw6vbLuV8_H3DsOwL8vvu2kqTjnpEa_7kuAiikaACD3pedtEw@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@google.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Javier Martinez Canillas <javier@dowhile0.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@google.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jul 23, 2014 at 8:12 PM, Sean Paul <seanpaul@google.com> wrote:
> On Wed, Jul 23, 2014 at 7:22 AM, Ajay kumar <ajaynumb@gmail.com> wrote:
>> Sean,
>>
>> On Tue, Jul 22, 2014 at 8:29 PM, Sean Paul <seanpaul@google.com> wrote:
>>> On Thu, Jul 17, 2014 at 4:43 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
>>>> Move the DP training and video enable from the hotplug handler into
>>>> a seperate function and call the same during dpms ON.
>>>>
>>>> With existing code, DP HPD should be generated just few ms before
>>>> calling enable_irq in dp_poweron.
>>>>
>>>> This patch removes that stringent time constraint.
>>>>
>>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>>>
>>>
>>> This looks eerily familiar to:
>>> https://chromium-review.googlesource.com/#/c/65782/
>>>
>>> In fact, I think it's probably better to do this in commit, rather than poweron.
>>>
>>> Sean
>> Your are right. This patch contains a subset of changes from the patch
>> you have mentioned.
>> But, If I provide commit calback to dp, then it would cause dp to
>> reinitialize twice
>> in quick successions - during dpms_on and during commit.
>> For the user, it would look like a glitch. So, I chose not to provide
>> a commit callback.
>>
>
> Interesting. At least in my testing, the absence of the commit
> callback causes my simple test app (which just does drmModeSetCrtc) to
> fail. In this case, by fail, I mean that the screen just shows black.
>
> Sean
I tried running modetest. It is running fine.
Also, exynos_drm_encoder_commit calls both dpms_on and
commit for the encoder. So, there should be no problem I guess!

Your testapp stops working only after adding this patch?

Ajay

>>>
>>>> ---
>>>>  drivers/gpu/drm/exynos/exynos_dp_core.c |   11 ++++++++++-
>>>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
>>>> index 845d766..a94b114 100644
>>>> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
>>>> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
>>>> @@ -875,10 +875,18 @@ static irqreturn_t exynos_dp_irq_handler(int irq, void *arg)
>>>>  static void exynos_dp_hotplug(struct work_struct *work)
>>>>  {
>>>>         struct exynos_dp_device *dp;
>>>> -       int ret;
>>>>
>>>>         dp = container_of(work, struct exynos_dp_device, hotplug_work);
>>>>
>>>> +       if (dp->drm_dev)
>>>> +               drm_helper_hpd_irq_event(dp->drm_dev);
>>>> +}
>>>> +
>>>> +static void exynos_dp_setup(void *in_ctx)
>>>> +{
>>>> +       struct exynos_dp_device *dp = in_ctx;
>>>> +       int ret;
>>>> +
>>>>         ret = exynos_dp_detect_hpd(dp);
>>>>         if (ret) {
>>>>                 /* Cable has been disconnected, we're done */
>>>> @@ -1059,6 +1067,7 @@ static void exynos_dp_poweron(struct exynos_dp_device *dp)
>>>>         exynos_dp_phy_init(dp);
>>>>         exynos_dp_init_dp(dp);
>>>>         enable_irq(dp->irq);
>>>> +       exynos_dp_setup(dp);
>>>>  }
>>>>
>>>>  static void exynos_dp_poweroff(struct exynos_dp_device *dp)
>>>> --
>>>> 1.7.9.5
>>>>
