From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 1/3] drm/exynos: free DP if probe fails to find a panel or
 bridge
Date: Sun, 23 Nov 2014 18:22:46 +0900
Message-ID: <001501d006ff$0b32a540$2197efc0$%han@samsung.com>
References: <1416527664-10553-1-git-send-email-gustavo@padovan.org>
 <CAEC9eQOfOo--vck78fJ4DGGD_Lwf9Lu+u7KgFSOuMZjih+WQTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:20567 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751383AbaKWJVo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 23 Nov 2014 04:21:44 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFH00D7OJC6C700@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 23 Nov 2014 18:21:42 +0900 (KST)
In-reply-to: <CAEC9eQOfOo--vck78fJ4DGGD_Lwf9Lu+u7KgFSOuMZjih+WQTQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ajay kumar' <ajaynumb@gmail.com>, 'Gustavo Padovan' <gustavo@padovan.org>, 'InKi Dae' <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, 'Gustavo Padovan' <gustavo.padovan@collabora.co.uk>, 'Jingoo Han' <jg1.han@samsung.com>

On Saturday, November 22, 2014 2:40 AM, Ajay kumar wrote:
> 
> On Fri, Nov 21, 2014 at 5:24 AM, Gustavo Padovan <gustavo@padovan.org> wrote:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >
> > DP was leaked everytime function returns EPROBE_DEFER, free it before
> > returning.
> >
> > Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > ---
> >  drivers/gpu/drm/exynos/exynos_dp_core.c | 21 +++++++++++++++------
> >  1 file changed, 15 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
> > index 85762cf..6fd4a46 100644
> > --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> > +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> > @@ -1336,8 +1336,10 @@ static int exynos_dp_probe(struct platform_device *pdev)
> >         if (panel_node) {
> >                 dp->panel = of_drm_find_panel(panel_node);
> >                 of_node_put(panel_node);
> > -               if (!dp->panel)
> > -                       return -EPROBE_DEFER;
> > +               if (!dp->panel) {
> > +                       ret = -EPROBE_DEFER;
> > +                       goto free_dp;
> > +               }
> >         }
> >
> >         endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> > @@ -1346,10 +1348,14 @@ static int exynos_dp_probe(struct platform_device *pdev)
> >                 if (bridge_node) {
> >                         dp->bridge = of_drm_find_bridge(bridge_node);
> >                         of_node_put(bridge_node);
> > -                       if (!dp->bridge)
> > -                               return -EPROBE_DEFER;
> > -               } else
> > -                       return -EPROBE_DEFER;
> > +                       if (!dp->bridge) {
> > +                               ret = -EPROBE_DEFER;
> > +                               goto free_dp;
> > +                       }
> > +               } else {
> > +                       ret = -EPROBE_DEFER;
> > +                       goto free_dp;
> > +               }
> >         }
> >
> >         exynos_dp_display.ctx = dp;
> > @@ -1359,6 +1365,9 @@ static int exynos_dp_probe(struct platform_device *pdev)
> >                 exynos_drm_component_del(&pdev->dev,
> >                                                 EXYNOS_DEVICE_TYPE_CONNECTOR);
> >
> > +free_dp:
> > +       devm_kfree(dev, dp);
> I guess the driver core takes care of freeing the devm memory when the
> probe fails?
> Will it not happen during PROBE_DEFER?
> 
> Inki/Jingoo - Is this change really necessary?

As far as I know, this devm_kfree() in unnecessary,
even though PROBE_DEFER is returned.
If I am wrong, please let me know. Thanks.

Best regards,
Jingoo Han

> 
> Ajay
> 
> >         return ret;
> >  }
> >
> > --
> > 1.9.3
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
