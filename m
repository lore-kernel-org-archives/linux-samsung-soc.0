From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH V2] media: s5p_mfc: Release ctx->ctx if failed to allocate
 ctx->shm
Date: Wed, 06 Aug 2014 08:32:04 +0900
Message-ID: <53E16974.5000404@samsung.com>
References: <1407231076-15506-1-git-send-email-zhaowei.yuan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1407231076-15506-1-git-send-email-zhaowei.yuan@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Zhaowei Yuan <zhaowei.yuan@samsung.com>, linux-media@vger.kernel.org, k.debski@samsung.com, m.chehab@samsung.com, kyungmin.park@samsung.com, jtp.park@samsung.com
Cc: linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 08/05/2014 06:31 PM, Zhaowei Yuan wrote:
> ctx->ctx should be released if the following allocation for ctx->shm
> gets failed.
> 
> Signed-off-by: Zhaowei Yuan <zhaowei.yuan@samsung.com>
> ---
>  drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c |    1 +
>  1 file changed, 1 insertion(+)
>  mode change 100644 => 100755 drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c

It's wrong to change file permission, please don't make a same mistake.
