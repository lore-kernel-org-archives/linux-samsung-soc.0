From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [RFC] drm/exynos: abort commit when framebuffer is removed from
 plane
Date: Wed, 9 Jul 2014 16:36:32 +0530
Message-ID: <CAPdUM4OOFbw+ygO-qbo=Wg4h40eL3nD4Ea9H4adh1EzcHZ8rcw@mail.gmail.com>
References: <1403190809-8413-1-git-send-email-rahul.sharma@samsung.com>
 <CAAQKjZMwVGHrrWNxn9ShrkZcnouOEhrH4kfCv9b3n4Zt1+vGqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAAQKjZMwVGHrrWNxn9ShrkZcnouOEhrH4kfCv9b3n4Zt1+vGqg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 8 July 2014 21:25, Inki Dae <inki.dae@samsung.com> wrote:
> 2014-06-20 0:13 GMT+09:00 Rahul Sharma <rahul.sharma@samsung.com>:
>> This situation arises when userspace remove the frambuffer object
>> and call setmode ioctl.
>>
>> drm_mode_rmfb --> drm_plane_force_disable --> plane->crtc = NULL;
>> and
>> drm_mode_setcrtc --> exynos_plane_commit --> passes plane->crtc to
>> exynos_drm_crtc_plane_commit which is NULL.
>
> If user process requested drm_mode_rmfb with a fb_id, fb object to the
> fb_id must be removed from crtc_idr table. So drm_mode_setcrtc should
> be failed because there is no the fb object in the crtc_idr table
> anymore.
> I cannot understand how exynos_drm_crtc_plane_commit function could be
> called. Can you give me more details?

Inki,

These logs should clarify more about the problem:

localhost ~ # halt
localhost ~ # [  130.570309] init: debugd main process (781) killed by
TERM signal
[  130.602453] init: lid_touchpad_helper main process (2100) killed by
TERM signal
[  131.374955] CPU: 2 PID: 834 Comm: X Tainted: G        W     3.16.0-rc1+ #623
[  131.380558] [<c00155b8>] (unwind_backtrace) from [<c001213c>]
(show_stack+0x20/0x24)
[  131.388327] [<c001213c>] (show_stack) from [<c05217d4>]
(dump_stack+0x7c/0x98)
[  131.395522] [<c05217d4>] (dump_stack) from [<c02ab7e4>]
(exynos_drm_crtc_plane_commit+0x20/0x40)
[  131.404263] [<c02ab7e4>] (exynos_drm_crtc_plane_commit) from
[<c02ae28c>] (exynos_plane_commit+0x24/0x28)
[  131.413779] [<c02ae28c>] (exynos_plane_commit) from [<c02ab1c8>]
(exynos_drm_crtc_commit+0x2c/0x54)
[  131.422802] [<c02ab1c8>] (exynos_drm_crtc_commit) from [<c02ab2c0>]
(exynos_drm_crtc_mode_set_commit.isra.1+0x8c/0xa0)
[  131.433468] [<c02ab2c0>] (exynos_drm_crtc_mode_set_commit.isra.1)
from [<c02ab3f0>] (exynos_drm_crtc_page_flip+0x100/0x174)
[  131.444587] [<c02ab3f0>] (exynos_drm_crtc_page_flip) from
[<c02a1ab4>] (drm_mode_page_flip_ioctl+0x1f0/0x2b0)
-->> [  131.454460] [<c02a1ab4>] (drm_mode_page_flip_ioctl) from
[<c0292cb4>] (drm_ioctl+0x270/0x44c)
[  131.462966] [<c0292cb4>] (drm_ioctl) from [<c011302c>]
(do_vfs_ioctl+0x4e4/0x5a0)
[  131.470397] [<c011302c>] (do_vfs_ioctl) from [<c0113144>]
(SyS_ioctl+0x5c/0x84)
[  131.477728] [<c0113144>] (SyS_ioctl) from [<c000e380>]
(ret_fast_syscall+0x0/0x30)
[  131.762797] CPU: 1 PID: 834 Comm: X Tainted: G        W     3.16.0-rc1+ #623
[  131.768378] [<c00155b8>] (unwind_backtrace) from [<c001213c>]
(show_stack+0x20/0x24)
[  131.776151] [<c001213c>] (show_stack) from [<c05217d4>]
(dump_stack+0x7c/0x98)
[  131.783315] [<c05217d4>] (dump_stack) from [<c029c130>]
(drm_plane_force_disable+0x5c/0x68)
[  131.791658] [<c029c130>] (drm_plane_force_disable) from
[<c029cf68>] (drm_framebuffer_remove+0xe4/0x110)
[  131.801070] [<c029cf68>] (drm_framebuffer_remove) from [<c02a09c0>]
(drm_mode_rmfb+0xd4/0xfc)
-->> [  131.809597] [<c02a09c0>] (drm_mode_rmfb) from [<c0292cb4>]
(drm_ioctl+0x270/0x44c)
[  131.817135] [<c0292cb4>] (drm_ioctl) from [<c011302c>]
(do_vfs_ioctl+0x4e4/0x5a0)
[  131.824609] [<c011302c>] (do_vfs_ioctl) from [<c0113144>]
(SyS_ioctl+0x5c/0x84)
[  131.831884] [<c0113144>] (SyS_ioctl) from [<c000e380>]
(ret_fast_syscall+0x0/0x30)
[  132.077803] CPU: 0 PID: 834 Comm: X Tainted: G        W     3.16.0-rc1+ #623
[  132.083413] [<c00155b8>] (unwind_backtrace) from [<c001213c>]
(show_stack+0x20/0x24)
[  132.091111] [<c001213c>] (show_stack) from [<c05217d4>]
(dump_stack+0x7c/0x98)
[  132.098343] [<c05217d4>] (dump_stack) from [<c02ab7e4>]
(exynos_drm_crtc_plane_commit+0x20/0x40)
[  132.107098] [<c02ab7e4>] (exynos_drm_crtc_plane_commit) from
[<c02ae28c>] (exynos_plane_commit+0x24/0x28)
[  132.116631] [<c02ae28c>] (exynos_plane_commit) from [<c02ab1c8>]
(exynos_drm_crtc_commit+0x2c/0x54)
[  132.125660] [<c02ab1c8>] (exynos_drm_crtc_commit) from [<c02ab2c0>]
(exynos_drm_crtc_mode_set_commit.isra.1+0x8c/0xa0)
[  132.136330] [<c02ab2c0>] (exynos_drm_crtc_mode_set_commit.isra.1)
from [<c02ab2ec>] (exynos_drm_crtc_mode_set_base+0x18/0x1c)
[  132.147605] [<c02ab2ec>] (exynos_drm_crtc_mode_set_base) from
[<c028c148>] (drm_crtc_helper_set_config+0x828/0x8a4)
[  132.158029] [<c028c148>] (drm_crtc_helper_set_config) from
[<c029ce1c>] (drm_mode_set_config_internal+0x58/0xc0)
[  132.168155] [<c029ce1c>] (drm_mode_set_config_internal) from
[<c029fe64>] (drm_mode_setcrtc+0x388/0x4ac)
-->> [  132.177630] [<c029fe64>] (drm_mode_setcrtc) from [<c0292cb4>]
(drm_ioctl+0x270/0x44c)
[  132.185417] [<c0292cb4>] (drm_ioctl) from [<c011302c>]
(do_vfs_ioctl+0x4e4/0x5a0)
[  132.192897] [<c011302c>] (do_vfs_ioctl) from [<c0113144>]
(SyS_ioctl+0x5c/0x84)
[  132.200138] [<c0113144>] (SyS_ioctl) from [<c000e380>]
(ret_fast_syscall+0x0/0x30)
[  132.207735] Unable to handle kernel NULL pointer dereference at
virtual address 0000032c
..
..
[  132.510786] ff80: b6ebdeb8 bee1d5e8 c06864a2 00000036 c000e5a4
ecf0e000 00000000 ecf0ffa8
[  132.518941] ffa0: c000e380 c01130f4 b6ebdeb8 bee1d5e8 00000005
c06864a2 bee1d5e8 00000001
[  132.527095] ffc0: b6ebdeb8 bee1d5e8 c06864a2 00000036 b85d4a74
b8702a60 00000000 bee1d688
[  132.535250] ffe0: b6a82f30 bee1d5cc b6a75cff b6bce50c 00000010
00000005 e1a0c00d e92dd800
[  132.543408] [<c02ab7e4>] (exynos_drm_crtc_plane_commit) from
[<c02ae28c>] (exynos_plane_commit+0x24/0x28)
[  132.552949] [<c02ae28c>] (exynos_plane_commit) from [<c02ab1c8>]
(exynos_drm_crtc_commit+0x2c/0x54)
[  132.561971] [<c02ab1c8>] (exynos_drm_crtc_commit) from [<c02ab2c0>]
(exynos_drm_crtc_mode_set_commit.isra.1+0x8c/0xa0)
[  132.572641] [<c02ab2c0>] (exynos_drm_crtc_mode_set_commit.isra.1)
from [<c02ab2ec>] (exynos_drm_crtc_mode_set_base+0x18/0x1c)
[  132.583919] [<c02ab2ec>] (exynos_drm_crtc_mode_set_base) from
[<c028c148>] (drm_crtc_helper_set_config+0x828/0x8a4)
[  132.594329] [<c028c148>] (drm_crtc_helper_set_config) from
[<c029ce1c>] (drm_mode_set_config_internal+0x58/0xc0)
[  132.604478] [<c029ce1c>] (drm_mode_set_config_internal) from
[<c029fe64>] (drm_mode_setcrtc+0x388/0x4ac)
[  132.613933] [<c029fe64>] (drm_mode_setcrtc) from [<c0292cb4>]
(drm_ioctl+0x270/0x44c)
[  132.621741] [<c0292cb4>] (drm_ioctl) from [<c011302c>]
(do_vfs_ioctl+0x4e4/0x5a0)
[  132.629201] [<c011302c>] (do_vfs_ioctl) from [<c0113144>]
(SyS_ioctl+0x5c/0x84)
[  132.636489] [<c0113144>] (SyS_ioctl) from [<c000e380>]
(ret_fast_syscall+0x0/0x30)
[  132.644035] Code: e8bd4000 e1a05000 e1a04001 eb09d7dc (e595032c)
[  132.650164] ---[ end trace 4bc5b9657975a179 ]---
[  132.654749] Kernel panic - not syncing: Fatal exception
[  132.659912] CPU3: stopping
[  132.662600] CPU: 3 PID: 478 Comm: rs:main Q:Reg Tainted: G      D W
    3.16.0-rc1+ #623
[  132.670673] [<c00155b8>] (unwind_backtrace) from [<c001213c>]
(show_stack+0x20/0x24)
[  132.678392] [<c001213c>] (show_stack) from [<c05217d4>]
(dump_stack+0x7c/0x98)
[  132.685590] [<c05217d4>] (dump_stack) from [<c001409c>]
(handle_IPI+0xd8/0x160)
[  132.692876] [<c001409c>] (handle_IPI) from [<c0008688>]
(gic_handle_irq+0x68/0x70)
[  132.700423] [<c0008688>] (gic_handle_irq) from [<c0012cc0>]
(__irq_svc+0x40/0x50)

Regards,
Rahul Sharma.

>
> Thanks,
> Inki Dae
>
>>
>> This crashes the system.
>>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> ---
>> This works fine but I am not confident on the correctness of the
>> solution.
>>
>>  drivers/gpu/drm/exynos/exynos_drm_crtc.c |    6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>> index 95c9435..da4efe4 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>> @@ -165,6 +165,12 @@ static int exynos_drm_crtc_mode_set_commit(struct drm_crtc *crtc, int x, int y,
>>                 return -EPERM;
>>         }
>>
>> +       /* when framebuffer is removed, commit should not proceed. */
>> +       if(!plane->fb){
>> +               DRM_ERROR("framebuffer has been removed from plane.\n");
>> +               return -EFAULT;
>> +       }
>> +
>>         crtc_w = crtc->primary->fb->width - x;
>>         crtc_h = crtc->primary->fb->height - y;
>>
>> --
>> 1.7.9.5
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
