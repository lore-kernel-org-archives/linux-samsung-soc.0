From: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/3] i2c-s3c2410: Rework device type handling
Date: Thu, 15 Mar 2012 11:04:56 +0100
Message-ID: <4F61BEC8.4030008@samsung.com>
References: <1331657679-31302-1-git-send-email-k.lewandowsk@samsung.com>
 <1331657679-31302-3-git-send-email-k.lewandowsk@samsung.com>
 <20120314172915.GB13393@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20120314172915.GB13393-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 14.03.2012 18:29, Mark Brown wrote:

> On Tue, Mar 13, 2012 at 05:54:38PM +0100, Karol Lewandowski wrote:
> 
>>  - replace s3c24xx_i2c_type enum with plain unsigned int that can
>>    hold not only device type but also hw revision-specific quirks
> 
> Would it not be clearer to just have explicit flags for the quirks (eg,
> as a set of bitfield flags)?


That would work on runtime but we also need to initialize this
somehow.  The way it was done today on non-dt platforms is via platform
device variants, i.e. (taken from 3rd patch):

@@ -1128,6 +1161,9 @@ static struct platform_device_id s3c24xx_driver_ids[] = {
 	}, {
 		.name		= "s3c2440-i2c",
 		.driver_data	= TYPE_S3C2440,
+	}, {
+		.name		= "s3c2440-hdmiphy-i2c",
+		.driver_data	= TYPE_S3C2440 | FLAG_HDMIPHY | FLAG_NO_GPIO,

Ability to address above scenario was sole motivation for this change.
Without it one would need either need separate type (e.g. 
TYPE_S3C2440_HDMIPHY) or setting flags based just on device name.

Introducing separate type (TYPE_S3C2440_HDMIPHY) has been our original
attempt to solve this issue.  However, this required adding explicit
checks to driver code all over the place (if (type == S3C2400 ||
type == S3c2440_HDMIPHY).

Thus, I felt that sqeezing quirks into type is a bit cleaner approach.

Regards,
-- 
Karol Lewandowski | Samsung Poland R&D Center | Linux/Platform
