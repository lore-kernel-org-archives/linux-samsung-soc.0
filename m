From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [RFC v2 1/2] drm/exynos: Add Picture Processor framework
Date: Tue, 09 May 2017 12:50:49 +0200
Message-ID: <a9ba721e-da6d-d59a-0fac-362569b1fe54@samsung.com>
References: <CGME20170508091206eucas1p182d473b7ec304bd71bd8e5c4d4938c53@eucas1p1.samsung.com>
 <1494234699-23843-1-git-send-email-m.szyprowski@samsung.com>
 <1494234699-23843-2-git-send-email-m.szyprowski@samsung.com>
 <CACvgo52aq--kby0stBjEyd4+8gcaQHBqzAxBzdV-jB6OgZfahw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:52724 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751723AbdEIKuy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 May 2017 06:50:54 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OPO00CTQM4R4Q90@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 May 2017 11:50:51 +0100 (BST)
In-reply-to: <CACvgo52aq--kby0stBjEyd4+8gcaQHBqzAxBzdV-jB6OgZfahw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Sakari Ailus <sakari.ailus@iki.fi>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hi Emil,

On 2017-05-08 15:43, Emil Velikov wrote:
> Hi Marek,
>
> A couple of small nitpicks from UAPI POV.

Thanks for your comments!

> On 8 May 2017 at 10:11, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
>> --- a/include/uapi/drm/exynos_drm.h
>> +++ b/include/uapi/drm/exynos_drm.h
>> +struct drm_exynos_pp_get_res {
>> +       __u64 pp_id_ptr;
>> +       __u32 count_pps;
> Add __u32 pad - sizeof(struct ...) should be multiple of sizeof(__u64).

ok

>> +struct drm_exynos_pp_get {
>> +       __u32 pp_id;
>> +       __u32 capabilities;
>> +
>> +       __u32 src_format_count;
>> +       __u32 dst_format_count;
>> +       __u32 params_count;
>> +       __u32 reserved1;
>> +
> Replace with __u32 flags; so that you can extend the struct as applicable.

ok

>> +       __u64 src_format_type_ptr;
>> +       __u64 dst_format_type_ptr;
>> +       __u64 params_ptr;
>> +       __u64 reserved2;
> And now you can drop this piece.
>
>
>> +struct drm_exynos_pp_commit {
>> +       __u32 id;
>> +       __u32 flags;
>> +       __u32 params_count;
>> +       __u32 reserved;
> Why the reserved here - flags should help you extend as needed.

To ensure that the structure will be a multiple of sizeof(u64).

>> +       __u64 param_ids_ptr;
>> +       __u64 param_values_ptr;
>> +       __u64 user_data;
> Unused user_data?

Nope. User_data provided here will be reported back to userspace in the 
struct
drm_exynos_pp_event, so we cannot drop it.

>> +struct drm_exynos_pp_event {
>> +       struct drm_event        base;
>> +       __u64                   user_data;
> Unused user_data?

See comment above.

>> +       __u32                   tv_sec;
>> +       __u32                   tv_usec;
>> +       __u32                   pp_id;
>> +       __u32                   sequence;
>> +       __u64                   reserved;
> Drop in favour of flags?

u64 flags? Probably u32 flags + u32 reserved would make a bit more sense to
keep structure a multiple of sizeof(u64).

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
