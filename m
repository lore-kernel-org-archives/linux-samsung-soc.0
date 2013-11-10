From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6] iio: exynos_adc: use wait_for_completion_timeout instead of interruptible
Date: Sun, 10 Nov 2013 13:48:35 +0100
Message-ID: <4523891.jQuDssBx5e@flatron>
References: <1381479821-17276-1-git-send-email-ch.naveen@samsung.com> <1383644730-23228-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383644730-23228-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Naveen,

On Tuesday 05 of November 2013 15:15:30 Naveen Krishna Chatradhi wrote:
> 1. The irq routine is so simple (just one register read) shouldn't be
> long Hence, reduce the timeout to 100milli secs,

I believe that the timeout value depends mostly on maximum conversion time 
and interrupt handler complexity is not very significant here.

> 2. With 100ms of wait time, interruptible is very much unnecessary.
>    Hence, use wait_for_completion_timeout instead of
>    wait_for_completion_interruptible_timeout
> 3. Reset software if a timeout happens.
> 4. Add reinit_completion() before the wait_for_completion_timeout in
> raw_read()

All the four points listed above, even just by the form they are written 
in, suggest that they should be separate four patches.

In addition, patch description should explain why such change is needed, 
i.e. what it fixes, improves or prepares the code for.

> Note: submitted for review at
> https://patchwork.kernel.org/patch/2279591/
> 

This should not be located in patch description, but rather in comments 
section below, as is the change log.

> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
> Reviewed-on: https://chromium-review.googlesource.com/172724
> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes since v1:
> As per discussion at
> http://marc.info/?l=linux-kernel&m=136517637228869&w=3
> 
> Changes since v2:
> None.
> Rebased and reposting.
> 
> Changes since v3:
> 1. commit message change and
> 2. removed an unncessary assignment
> 
> Changes since v4:
> Moved INIT_COMPLETION call to the starting of the function
> 
> Changes since v5:
> INIT_COMPLETION was replaced by reinit_completion
> ("tree-wide: use reinit_completion instead of INIT_COMPLETION").
> Use it to avoid the following build error:
> undefined identifier 'INIT_COMPLETION'

Not really a comment to the patch, but rather a suggestion for future:

It is more convenient to read the change log if it goes from newest to 
oldest order.

Otherwise the changes alone look good.

Best regards,
Tomasz
