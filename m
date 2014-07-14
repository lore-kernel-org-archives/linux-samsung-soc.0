From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH V4 00/10] drm: exynos: few patches to enhance bridge chip
 support
Date: Mon, 14 Jul 2014 10:22:13 -0700
Message-ID: <CAOesGMgvLr+14tFP3N-kTwH9wJ8+1=OXoiEo9_KFDyOSFpK7nw@mail.gmail.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
 <53B4E7D6.6000204@suse.de>
 <CAD=FV=UH=sgZKFxH35qfBb-XJGJ9ctSSdVRhTEkt6zk0f+R4mA@mail.gmail.com>
 <CAEC9eQO+j8iikztW4Q47xKRM71C6qGaCuBTdSW=odKG0kRsWBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQO+j8iikztW4Q47xKRM71C6qGaCuBTdSW=odKG0kRsWBg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: InKi Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Doug Anderson <dianders@chromium.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Andrzej Hajda <a.hajda@samsung.com>, Ajay kumar <ajaynumb@gmail.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Inki,

You have acks, and you have the tested-bys you requested. Can you
please pick this up quickly so that we can have graphics working with
an upstream kernel on chromebooks?

Dave, if Inki keeps dragging his feet like this can you please apply
this series directly? These delays are ridiculous and it's hurting
forward progress on the platform as a whole.


Thanks,

-Olof


On Tue, Jul 8, 2014 at 11:11 PM, Ajay kumar <ajaynumb@gmail.com> wrote:
> Hi Daniel, Thierry and Rob,
>
> Currently, the following boards are working fine with the bridge chip series:
> - snow
> - spring
> - peach_pit
> - peach_pi
> And, I did change my original patchset based on your comments here:
> (1) [RFC V2 0/3] drm/bridge: panel and chaining
>         http://www.spinics.net/lists/linux-samsung-soc/msg30160.html
> (2) [RFC V3 0/3] drm/bridge: panel and chaining
>         http://www.spinics.net/lists/linux-samsung-soc/msg30507.html
>
> If you think this is not the right way of doing it, please come forward with
> more suggestions, or kindly ACK it.
> I am just wondering how long can I keep waiting for comments?
>
> Regards,
> Ajay
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
