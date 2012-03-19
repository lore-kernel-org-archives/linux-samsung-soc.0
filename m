From: Lukasz Majewski <l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] usb: gadget: s3c-hsotg: fix kernel panic
Date: Mon, 19 Mar 2012 17:52:08 +0100
Message-ID: <20120319175208.274ca294@lmajewski.digital.local>
References: <1331904920-19685-1-git-send-email-sangwook.lee@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1331904920-19685-1-git-send-email-sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sangwook Lee <sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 16 Mar 2012 13:35:20 +0000
Sangwook Lee <sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> Fix kernel panic from s3c_hsotg_udc_stop.
> if udc_is_newstyle is true, s3c_hsotg_udc_stop should not
> call disconnect, unbind.
> 
> As running rmmod g_mass_storage, kernel panic happens.
> 
> (composite_unbind+0x14/0x164 [g_mass_storage])
> from [<c023e950>] (s3c_hsotg_udc_stop)
> 
> This patch is based on Lukasz Majewski's patches:
> [PATCH 0/9] USB: s3c-hsotg: USB S3C-HSOTG driver fixes and code cleanu
> 
> in order to test g_mass_storage in Origen board:
> 
> Signed-off-by: Sangwook Lee <sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/usb/gadget/s3c-hsotg.c |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
> 

Hi Sangwook,

Test HW: GONI S5PV210 
module: g_ether.ko

Yes, this patch works. Thanks for spotting the error.

Tested-by: Lukasz Majewski <l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>


-- 
Best regards,

Lukasz Majewski

Samsung Poland R&D Center
Platform Group
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
