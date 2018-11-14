From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] extcon: max8997: Fix lack of path setting in USB device
 mode
Date: Wed, 14 Nov 2018 09:07:35 +0900
Message-ID: <5BEB6747.7080604@samsung.com>
References: <CGME20181113153859eucas1p1dfc17519a7e960096d2888e47ab18dd8@eucas1p1.samsung.com>
        <20181113153847.14732-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20181113153847.14732-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 2018년 11월 14일 00:38, Marek Szyprowski wrote:
> MAX8997 driver disables automatic path selection from MicroUSB connector
> and manually sets path to either UART or USB lines. However the code for
> setting USB path worked only for USB host mode (when ID pin is set
> to ground). When standard USB cable (USB device mode) is connected, path
> registers are not touched. This means that once the non-USB accessory is
> connected to MAX8997-operated micro USB port, the path is no longer set
> to USB and USB device mode doesn't work. This patch fixes it by setting
> USB path both for USB and USB host modes.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/extcon/extcon-max8997.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-max8997.c b/drivers/extcon/extcon-max8997.c
> index 632192d027bf..172e116ac1ce 100644
> --- a/drivers/extcon/extcon-max8997.c
> +++ b/drivers/extcon/extcon-max8997.c
> @@ -311,12 +311,10 @@ static int max8997_muic_handle_usb(struct max8997_muic_info *info,
>  {
>  	int ret = 0;
>  
> -	if (usb_type == MAX8997_USB_HOST) {
> -		ret = max8997_muic_set_path(info, info->path_usb, attached);
> -		if (ret < 0) {
> -			dev_err(info->dev, "failed to update muic register\n");
> -			return ret;
> -		}
> +	ret = max8997_muic_set_path(info, info->path_usb, attached);
> +	if (ret < 0) {
> +		dev_err(info->dev, "failed to update muic register\n");
> +		return ret;
>  	}
>  
>  	switch (usb_type) {
> 

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
