From: Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH V4 0/2] Add DT support for i2s
Date: Wed, 28 Nov 2012 16:17:47 +0530
Message-ID: <1354099669-1735-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: padma.kvr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

V4 patches are based on Mark Brown's for-next branch of
"git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git"
 
Changes since V3:
	- Added syntex of gpio specifier as suggested by Mark Brown in
	  DT document file
	- Added the requirement for having I2S alias ids
	- Explained about gpio lines
	- Made a seperate patch to get the I2S rclk src clk from alias ID
	  	 
Changes since V2:
        - Rebased on 3.7-rc3
        - Custom DT bindings are prefixed with samsung
        - As generic device tree DMA helpers not yet mainlined
          I am still using custom dma bindings. So added a
          priliminary statement regarding the same. I will rework
          on my patch once generic DMA helpers are mainlined.

Chnages since V1:
        - Rebased on 3.6-rc6

Padmavathi Venna (2):
  ASoC: Samsung: Get I2S src_clk from clock alias id.
  ASoC: SAMSUNG: Add DT support for i2s

 .../devicetree/bindings/sound/samsung-i2s.txt      |   78 +++++++
 include/linux/platform_data/asoc-s3c.h             |    6 -
 sound/soc/samsung/dma.c                            |    1 +
 sound/soc/samsung/dma.h                            |    1 +
 sound/soc/samsung/i2s.c                            |  238 +++++++++++++++----
 5 files changed, 268 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt

-- 
1.7.4.4
