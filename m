From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] Documentation/watchdog: Update node name in samsung-wdt
 example
Date: Mon, 28 Oct 2013 06:37:45 -0700
Message-ID: <526E68A9.8030002@roeck-us.net>
References: <1382941457-2826-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1382941457-2826-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, linux-doc@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, wim@iguana.be, rob@landley.net, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 10/27/2013 11:24 PM, Sachin Kamat wrote:
> Update the name as per DT naming convention.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>   .../devicetree/bindings/watchdog/samsung-wdt.txt   |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> index 4c798e3..0642fb8 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> @@ -17,7 +17,7 @@ Optional properties:
>
>   Example:
>
> -watchdog {
> +watchdog@101D0000 {
>   	compatible = "samsung,s3c2410-wdt";
>   	reg = <0x101D0000 0x100>, <0x10040408 0x4>, <0x1004040c 0x4>;
>   	interrupts = <0 42 0>;
>

Sachin,

It appears that this patch depends on some other patch which is not upstream yet.
It is not in -next either. Can you point to that other patch ?

Thanks,
Guenter



