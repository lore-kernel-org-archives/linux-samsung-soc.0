From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] drm/exynos: fix nested calls to lock mutex in drm resume
Date: Fri, 23 May 2014 00:32:03 +0900
Message-ID: <CAH9JG2VhH+8HiVgO90f_V9FbWRDhDK3au-qoO+sLy9+510Xn8g@mail.gmail.com>
References: <1398865294-6754-1-git-send-email-rahul.sharma@samsung.com>
 <CAPdUM4M3MdM2Dm2GPYXD-A18YDVGmKKBz+-uGDOmiTO=WUKu8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAPdUM4M3MdM2Dm2GPYXD-A18YDVGmKKBz+-uGDOmiTO=WUKu8A@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rahul Sharma <rahul.sharma@samsung.com>, =?UTF-8?B?64yA7J246riw?= <inki.dae@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

add Mr. Dae

On Thu, May 22, 2014 at 11:16 PM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Hi Inki,
>
> This is another one which has not got reviewed. Please review.
>
> Regards,
> Rahul Sharma
>
> On 30 April 2014 19:11, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>>
>> While testing S2R on exynos board, system is hanging and
>> rebooting due to nested mutex_lock calls in exynos drm
>> resume callback. Changing the order of the calls is fixing
>> the issue.
>>
>> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
>> ---
>> Based on exynos-drm-next branch in Inki Dae's tree.
>>  drivers/gpu/drm/exynos/exynos_drm_drv.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> index bb7dfee..2bb6233 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> @@ -184,8 +184,8 @@ static int exynos_drm_resume(struct drm_device *dev)
>>                         connector->funcs->dpms(connector, connector->dpms);
>>         }
>>
>> -       drm_helper_resume_force_mode(dev);
>>         drm_modeset_unlock_all(dev);
>> +       drm_helper_resume_force_mode(dev);
>>
>>         return 0;
>>  }
>> --
>> 1.7.9.5
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
