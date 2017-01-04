From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: reserved_mem: set dma_ops for devices using reserved
 mem
Date: Wed, 4 Jan 2017 14:02:09 -0600
Message-ID: <20170104200209.pefpffxssu46qqcq@rob-hp-laptop>
References: <1482299071-22637-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1482299071-22637-1-git-send-email-pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Smitha T Murthy <smitha.t-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Dec 21, 2016 at 11:14:31AM +0530, Pankaj Dubey wrote:
> From: Smitha T Murthy <smitha.t-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> For some IPs, there may be virtual child devices created and for them its
> necessary to set the dma_ops if it's using reserved memory else it will call
> the dummy dma_ops during buffer operations for the child devices which will
> lead to memory mapping failure.
> 
> Signed-off-by: Smitha T Murthy <smitha.t-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/of/of_reserved_mem.c | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
