From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add Patchwork URL to Samsung Exynos entry
Date: Thu, 8 Dec 2016 18:38:30 +0200
Message-ID: <20161208163830.GA5238@kozik-lap>
References: <1481131115-11143-1-git-send-email-krzk@kernel.org>
 <F4BA1C22-7E6C-4791-9B0D-37B3F647E0EB@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <F4BA1C22-7E6C-4791-9B0D-37B3F647E0EB@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Dec 08, 2016 at 11:24:43AM +0900, Kukjin Kim wrote:
> 2016. 12. 8. 02:18 Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > I use Patchwork for handling incoming patches. Put its address here so
> > submitters could know what is in the queue.
> 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> > MAINTAINERS | 1 +
> > 1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 191887bdc49b..ec5137c39572 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1689,6 +1689,7 @@ M:    Krzysztof Kozlowski <krzk@kernel.org>
> > R:    Javier Martinez Canillas <javier@osg.samsung.com>
> > L:    linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > L:    linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> > +Q:    https://patchwork.kernel.org/project/linux-samsung-soc/list/
> 
> to use http would be better instead of https?

I think HTTPS is the preferred way. HTTP is insecure, easy to eavesdrop
so whenever it is possible we should choose HTTPS.
> 
> then,
> 
> Acked-by: Kukjin Kim <kgene@kernel.org>

Thanks!

Best regards,
Krzysztof
