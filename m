From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 3/7] drm/panel: Add driver for exynos_dp based panels
Date: Mon, 21 Apr 2014 09:34:44 +0900
Message-ID: <004001cf5cf9$7e2a0990$7a7e1cb0$%han@samsung.com>
References: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
 <1397658786-26138-4-git-send-email-ajaykumar.rs@samsung.com>
 <000101cf5ae2$c7423f30$55c6bd90$%han@samsung.com>
 <CAEC9eQPU1o4c30_VWJcoC1uwZC1yNNvq7GoKp=JhVMeEuz375g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CAEC9eQPU1o4c30_VWJcoC1uwZC1yNNvq7GoKp=JhVMeEuz375g@mail.gmail.com>
Content-language: ko
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: 'Ajay kumar' <ajaynumb@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Sean Paul' <seanpaul@google.com>, abrestic@chromium.org, 'sunil joshi' <joshi@samsung.com>, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, 'Kyungmin Park' <kyungmin.park@samsung.com>, treding@nvidia.com, 'Prashanth G' <prashanth.g@samsung.com>, 'Ajay Kumar' <ajaykumar.rs@samsung.com>, 'Rahul Sharma' <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Saturday, April 19, 2014 4:43 AM, Ajay kumar wrote:
> On Fri, Apr 18, 2014 at 2:17 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> > On Wednesday, April 16, 2014 11:33 PM, Ajay Kumar wrote:

[.....]

> > > +struct panel_exynos_dp {
> > > +     struct drm_panel        base;
> > > +     struct regulator        *bck_fet;
> > > +     struct regulator        *lcd_fet;
> > 'bck' means 'backlight'? Then, just use 'backlight_fet'.
> backlight_fet is more meaningful. Will change it.
> > Also, I cannot understand the meaning of 'fet'.
> > What's the meaning of the 'fet'?
>
> FET is an output from the regulator. On exynos5250-snow board,
> FET1 controls power to the backlight unit.
> See more here: https://lkml.org/lkml/2014/4/15/618 

OK, I see.

PS: Please change your mail from 'html' mode to 'text' mode.

Best regards,
Jingoo Han
