From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V6 6/8] drm/bridge: Modify drm_bridge core to support
 driver model
Date: Mon, 25 Aug 2014 11:41:44 +0530
Message-ID: <CAEC9eQOA0NAfAORmd8REvORAPhg2ZdoCMTCrP=KiE_rFABOZ=A@mail.gmail.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406316130-4744-7-git-send-email-ajaykumar.rs@samsung.com>
 <20140730111931.GI29590@ulmo>
 <CAEC9eQPv-D2ThnHR=FZiXJJisMf9NRqS-TJQKdZRjV45Y0Mjsw@mail.gmail.com>
 <20140730150846.GB1345@ulmo>
 <CAEC9eQMywCiQjD68_=Wwwbnb4Gau-gNEowqWPSvSV=AOc3Waeg@mail.gmail.com>
 <20140731105813.GE7458@ulmo>
 <CABxcv=m0eZAOSmTD4GyRmy2eztyBZ3ed27eJEmLXc6cVkZF0iA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CABxcv=m0eZAOSmTD4GyRmy2eztyBZ3ed27eJEmLXc6cVkZF0iA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Javier,

On Sat, Aug 23, 2014 at 5:03 AM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
> Hello Ajay,
>
> On Thu, Jul 31, 2014 at 12:58 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
>> On Wed, Jul 30, 2014 at 09:33:28PM +0530, Ajay kumar wrote:
>>> On Wed, Jul 30, 2014 at 8:38 PM, Thierry Reding <thierry.reding@gmail.com> wrote:
>> [...]
>>> > I think it should even be possible to do this in more separate steps.
>>> > For example you could add the new bridge infrastructure without touching
>>> > any of the existing drivers (so that they are completely unaffected by
>>> > the changes) and then start converting one by one.
>>> >
>>> > For some of the changes this may be difficult (such as the dev ->
>>> > drm_dev rename to make room for the new struct device *dev). But that
>>> > could for example be done in a preparatory patch that first renames the
>>> > field, so that the "infrastructure" patch can add the new field without
>>> > renaming any fields and therefore needing changes to drivers directly.
>>> >
>>> > The goal of that whole exercise is to allow display drivers to keep
>>> > working with the existing API (ptn3460_init()) while we convert the
>>> > bridge drivers to register with the new framework. Then we can more
>>> > safely convert each display driver individually to make use of the new
>>> > framework and once all drivers have been converted the old API can
>>> > simply be removed.
>>> >
>>> > That way there should be no impact on existing functionality at any
>>> > point.
>>> As of now only exynos_dp uses ptn3460_init.
>>> And, also only 2 drivers use drm_bridge_init.
>>> It should be really easy to bisect if something goes wrong.
>>> Still, I will try to divide it so that each patch contains minimal change.
>>
>> Thanks.
>>
>
> Do you plan to address Thierry's concerns and re-spin this patch?
>
> Same question for patches:
>
> "drm/bridge: Add i2c based driver for ptn3460 bridge"
> "drm/bridge: Add i2c based driver for ps8622/ps8625 bridge"
Yes, I will. I was caught up with some other work.
I will be sending a version ASAP.

Ajay
