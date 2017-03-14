From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v3 3/3] watchdog: s3c2410: Minor code cleanup
Date: Tue, 14 Mar 2017 14:20:21 +0100
Message-ID: <1563377.9eIcBQftln@amdc3058>
References: <20170313190726.2988-1-krzk@kernel.org>
 <20170313190726.2988-4-krzk@kernel.org>
 <CGME20170314132022epcas1p26da7dbe4da6d77ebfc1a8e045ee370de@epcas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20170313190726.2988-4-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Monday, March 13, 2017 09:07:26 PM Krzysztof Kozlowski wrote:
> Cleanup the code from minor readability issues (no functional changes):
> 1. Fix checkpatch: ERROR: Do not include the paragraph about writing to
>    the Free Software Foundation's mailing address.
> 2. Fix checkpatch: WARNING: quoted string split across lines
> 3. Fix chechpatch: WARNING: Prefer 'unsigned int' to bare use of
>    'unsigned'
> 4. Use 'dev' consistently in probe function instead of mixing dev with
>    &pdev->dev.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
