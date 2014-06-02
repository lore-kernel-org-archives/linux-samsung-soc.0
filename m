From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] drm/exynos: remove hardware overlays disable from fimd
 probe
Date: Mon, 02 Jun 2014 13:48:55 +0200
Message-ID: <538C64A7.50900@samsung.com>
References: <1401257471-31994-1-git-send-email-rahul.sharma@samsung.com>
 <538C3FC4.6090509@samsung.com>
 <CAPdUM4POJwfe_RyKV+ym=ENgVF+2To0qgS88UGp1ueBD3LH4ig@mail.gmail.com>
 <538C4DE0.50801@gmail.com> <538C551E.30407@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <538C551E.30407@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomasz Figa <tomasz.figa@gmail.com>, Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene.kim@samsung.com>, "Szyprowski,
 Marek" <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 06/02/2014 12:42 PM, Andrzej Hajda wrote:
> On 06/02/2014 12:11 PM, Tomasz Figa wrote:
>> Hi Rahul, Andrzej,
>>
>> On 02.06.2014 11:42, Rahul Sharma wrote:
>>> On 2 June 2014 14:41, Andrzej Hajda <a.hajda@samsung.com> wrote:
>>>> Hi Rahul,
>>>>
>>>> On 05/28/2014 08:11 AM, Rahul Sharma wrote:
>>>>> System hangs when FIMD registers are accessed to disable
>>>>> hardware overlays. This is because of the clocks which are
>>>>> not enabled before register access.
>>>>>
>>>>> 'Hardware overlay disable' is cleaned from the FIMD probe.
>>>>>
>>>>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>>>>
>>>> This patch causes regression on some exynos4210-universal_c210 devices,
>>>> everything works expect colors are incorrect - it seems blue component
>>>> is very dark, almost black.
>>>>
>>>
>>> Oh.... Sorry for that. I did not see any problem on 5250/5420/5800. I do not
>>> have setup for 4210. Better we should revert this patch.
>>>
>>> Would you please help me by verifying the following patch on 4210? This
>>> is an alternate solution to the same problem.
>>>
>>> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg31426.html
>>>
>>> Thanks Andrej, for bringing it to notice.
>>
>> I don't see how this patch could introduce such regression, as all the
>> affected registers seem to be properly reconfigured in fimd_win_commit()
>> anyway.
>>
>> IMHO instead of reverting the patch, this issue should be investigated
>> and fixed properly.
>>
>> Best regards,
>> Tomasz
>>
> 
> I am looking at the problem, it is quite strange as it happens only on
> one of two targets I have access to. Anyway it seems that something
> should be added to fimd initialization sequence if we want to remove hw
> accessing code from probe.

The problem is that fimd does not clear unused windows.
Simple patch which helps:

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 2ec634f..b58fce2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -741,6 +741,8 @@ static void fimd_apply(struct exynos_drm_manager *mgr)
                win_data = &ctx->win_data[i];
                if (win_data->enabled)
                        fimd_win_commit(mgr, i);
+               else
+                       fimd_win_disable(mgr, i);
        }

        fimd_commit(mgr);

But I am not fully familiar with window management code, so I do not
know if it does not breaks other stuff.

Regards
Andrzej

> 
> Regards
> Andrzej
> 
