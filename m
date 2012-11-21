From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 132/493] Input: remove use of __devexit_p
Date: Wed, 21 Nov 2012 11:48:58 +0000
Message-ID: <20121121114858.GE3290@n2100.arm.linux.org.uk>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu> <1353349642-3677-132-git-send-email-wfp5p@virginia.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1353349642-3677-132-git-send-email-wfp5p@virginia.edu>
Sender: linux-input-owner@vger.kernel.org
To: Bill Pemberton <wfp5p@virginia.edu>
Cc: gregkh@linuxfoundation.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wan ZongShun <mcuos.com@gmail.com>, Miloslav Trmac <mitr@volny.cz>, Javier Martinez Canillas <javier@dowhile0.org>, Pau Oliva Fora <pof@eslack.org>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-input@vger.kernel.org, device-drivers-devel@blackfin.uclinux.org, linux-arm-kernel@lists.infradead.org, patches@opensource.wolfsonmicro.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Nov 19, 2012 at 01:21:21PM -0500, Bill Pemberton wrote:
>  drivers/input/serio/ambakmi.c               | 2 +-
>  drivers/input/serio/pcips2.c                | 2 +-
>  drivers/input/serio/rpckbd.c                | 2 +-
>  drivers/input/serio/sa1111ps2.c             | 2 +-

For these four,

Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
