From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] i2c: s3c2410: Properly handle interrupts of number 0
Date: Fri, 2 Mar 2018 15:26:56 +0300
Message-ID: <20180302122655.uckejonjyzt4vjd3@mwanda>
References: <1519936484-23132-1-git-send-email-krzk@kernel.org>
 <20180302111931.GX9418@n2100.armlinux.org.uk>
 <20180302114909.u6kqdszt3aew2io2@mwanda>
 <20180302121929.GY9418@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180302121929.GY9418@n2100.armlinux.org.uk>
Sender: stable-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>
List-Id: linux-samsung-soc@vger.kernel.org

Ok, but in that case the original code is still wrong because it returns
early with success.  I guess it could be changed to:

	if (irq <= 0)
		return -ENXIO;

regards,
dan carpenter
