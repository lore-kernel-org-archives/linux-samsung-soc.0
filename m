From: Felipe Balbi <balbi@kernel.org>
Subject: Re: PROBLEM: DWC3 USB 3.0 not working on Odroid-XU4 with Exynos 5422
Date: Mon, 29 Aug 2016 10:28:32 +0300
Message-ID: <87lgzgdof3.fsf@linux.intel.com>
References: <1472414695.3845.3.camel@mniewoehner.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:42226 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750828AbcH2H2v (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Aug 2016 03:28:51 -0400
In-Reply-To: <1472414695.3845.3.camel@mniewoehner.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Michael =?utf-8?Q?Niew=C3=B6hner?= <linux@mniewoehner.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Michael Niew=C3=B6hner <linux@mniewoehner.de> writes:
> [1.] One line summary of the problem:
> DWC3 USB 3.0 not working on Odroid-XU4 with Exynos 5422
>
> [2.] Full description of the problem/report:
> No usb 3.0 devices are being detected when attached while USB 2.0
> devices work on the same port.
> USB 3.0 works after applying patches [9.1] and [9.2], but seems to be
> buggy. The usb hub is redetected every time an usb device is attached.

dwc3 is host, which means it's actually XHCI :-)

Adding Mathias

> dmesg:
> [=C2=A0=C2=A0192.287080] usb 3-1.2: USB disconnect, device number 7
> [=C2=A0=C2=A0210.370699] hub 3-1:1.0: hub_ext_port_status failed (err =3D=
 -71)
> [=C2=A0=C2=A0210.375159] usb 3-1-port2: connect-debounce failed
> [=C2=A0=C2=A0210.380126] usb 3-1: USB disconnect, device number 5
> [=C2=A0=C2=A0210.488917] usb 4-1: USB disconnect, device number 3
> [=C2=A0=C2=A0210.708861] usb 3-1: new high-speed USB device number 9 usin=
g xhci-hcd
> [=C2=A0=C2=A0210.851308] usb 3-1: New USB device found, idVendor=3D05e3, =
idProduct=3D0610
> [=C2=A0=C2=A0210.856530] usb 3-1: New USB device strings: Mfr=3D1, Produc=
t=3D2, SerialNumber=3D0
> [=C2=A0=C2=A0210.863696] usb 3-1: Product: USB2.0 Hub
> [=C2=A0=C2=A0210.867721] usb 3-1: Manufacturer: GenesysLogic
> [=C2=A0=C2=A0210.877800] hub 3-1:1.0: USB hub found
> [=C2=A0=C2=A0210.880600] hub 3-1:1.0: 2 ports detected
> [=C2=A0=C2=A0210.913438] [drm:hdmi_probe] *ERROR* Failed to get ddc i2c a=
dapter by node
> [=C2=A0=C2=A0211.468970] usb 3-1.2: new high-speed USB device number 10 u=
sing xhci-hcd
> [=C2=A0=C2=A0211.579279] usb 3-1.2: New USB device found, idVendor=3D0951=
, idProduct=3D1666
> [=C2=A0=C2=A0211.584667] usb 3-1.2: New USB device strings: Mfr=3D1, Prod=
uct=3D2, SerialNumber=3D3
> [=C2=A0=C2=A0211.592002] usb 3-1.2: Product: DataTraveler 3.0
> [=C2=A0=C2=A0211.596720] usb 3-1.2: Manufacturer: Kingston
> [=C2=A0=C2=A0211.601075] usb 3-1.2: SerialNumber: 00190F0C0295BE711962B008
> [=C2=A0=C2=A0211.607557] usb-storage 3-1.2:1.0: USB Mass Storage device d=
etected
> [=C2=A0=C2=A0211.613640] scsi host0: usb-storage 3-1.2:1.0
> [=C2=A0=C2=A0211.620179] [drm:hdmi_probe] *ERROR* Failed to get ddc i2c a=
dapter by node
> [=C2=A0=C2=A0212.677008] scsi 0:0:0:0: Direct-Access=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0Kingston DataTraveler 3.0 PMAP PQ: 0 ANSI: 6
> [=C2=A0=C2=A0212.685208] sd 0:0:0:0: Attached scsi generic sg0 type 0
> [=C2=A0=C2=A0212.687323] [drm:hdmi_probe] *ERROR* Failed to get ddc i2c a=
dapter by node
> [=C2=A0=C2=A0214.209074] usb 4-1: new SuperSpeed USB device number 4 usin=
g xhci-hcd
> [=C2=A0=C2=A0214.231660] usb 4-1: New USB device found, idVendor=3D05e3, =
idProduct=3D0616
> [=C2=A0=C2=A0214.236882] usb 4-1: New USB device strings: Mfr=3D1, Produc=
t=3D2, SerialNumber=3D0
> [=C2=A0=C2=A0214.244057] usb 4-1: Product: USB3.0 Hub
> [=C2=A0=C2=A0214.248060] usb 4-1: Manufacturer: GenesysLogic
> [=C2=A0=C2=A0214.254181] hub 4-1:1.0: USB hub found
> [=C2=A0=C2=A0214.256754] hub 4-1:1.0: 2 ports detected
> [=C2=A0=C2=A0214.264279] [drm:hdmi_probe] *ERROR* Failed to get ddc i2c a=
dapter by node
> [=C2=A0=C2=A0214.634773] sd 0:0:0:0: [sda] 61457664 512-byte logical bloc=
ks: (31.5 GB/29.3 GiB)
> [=C2=A0=C2=A0214.641164] sd 0:0:0:0: [sda] Write Protect is off
> [=C2=A0=C2=A0214.645631] sd 0:0:0:0: [sda] Mode Sense: 23 00 00 00
> [=C2=A0=C2=A0214.645900] sd 0:0:0:0: [sda] No Caching mode page found
> [=C2=A0=C2=A0214.650978] sd 0:0:0:0: [sda] Assuming drive cache: write th=
rough [=C2=A0=C2=A0214.682552]=C2=A0=C2=A0sda: sda1
> [=C2=A0=C2=A0214.685165] sd 0:0:0:0: [sda] Attached SCSI removable disk
> [=C2=A0=C2=A0234.526936] usb 3-1.2: USB disconnect, device number 10
>
> [3.] Keywords (i.e., modules, networking, kernel):
> usb 3.0, dwc3, exynos, odroid
> =C2=A0
> [4.] Kernel information
> 4.6.x, 4.7.x
>
> [4.1.] Kernel version (from /proc/version):
> Linux version 4.7.2+ (c0d3@z3r0) (gcc version 5.3.1 20160113 (Linaro
> GCC 5.3-2016.02) ) #1 SMP Sun Aug 28 18:52:25 CEST 2016
>
> [4.2.] Kernel .config file:
> #cat .config | grep -E "(USB|DWC|DRD).*=3D(m|y)"
> CONFIG_CAN_EMS_USB=3Dm
> CONFIG_CAN_ESD_USB2=3Dm
> CONFIG_CAN_GS_USB=3Dm
> CONFIG_CAN_KVASER_USB=3Dm
> CONFIG_CAN_PEAK_USB=3Dm
> CONFIG_CAN_8DEV_USB=3Dm
> CONFIG_BT_HCIBTUSB=3Dm
> CONFIG_BT_HCIBTUSB_BCM=3Dy
> CONFIG_BT_HCIBTUSB_RTL=3Dy
> CONFIG_USB_NET_DRIVERS=3Dy
> CONFIG_USB_CATC=3Dm
> CONFIG_USB_KAWETH=3Dm
> CONFIG_USB_PEGASUS=3Dm
> CONFIG_USB_RTL8150=3Dm
> CONFIG_USB_RTL8152=3Dm
> CONFIG_USB_USBNET=3Dm
> CONFIG_USB_NET_AX8817X=3Dm
> CONFIG_USB_NET_AX88179_178A=3Dm
> CONFIG_USB_NET_CDCETHER=3Dm
> CONFIG_USB_NET_CDC_EEM=3Dm
> CONFIG_USB_NET_CDC_NCM=3Dm
> CONFIG_USB_NET_HUAWEI_CDC_NCM=3Dm
> CONFIG_USB_NET_CDC_MBIM=3Dm
> CONFIG_USB_NET_DM9601=3Dm
> CONFIG_USB_NET_SR9700=3Dm
> CONFIG_USB_NET_SR9800=3Dm
> CONFIG_USB_NET_SMSC75XX=3Dm
> CONFIG_USB_NET_SMSC95XX=3Dm
> CONFIG_USB_NET_GL620A=3Dm
> CONFIG_USB_NET_NET1080=3Dm
> CONFIG_USB_NET_PLUSB=3Dm
> CONFIG_USB_NET_MCS7830=3Dm
> CONFIG_USB_NET_RNDIS_HOST=3Dm
> CONFIG_USB_NET_CDC_SUBSET_ENABLE=3Dm
> CONFIG_USB_NET_CDC_SUBSET=3Dm
> CONFIG_USB_ALI_M5632=3Dy
> CONFIG_USB_AN2720=3Dy
> CONFIG_USB_BELKIN=3Dy
> CONFIG_USB_ARMLINUX=3Dy
> CONFIG_USB_EPSON2888=3Dy
> CONFIG_USB_KC2190=3Dy
> CONFIG_USB_NET_ZAURUS=3Dm
> CONFIG_USB_NET_CX82310_ETH=3Dm
> CONFIG_USB_NET_KALMIA=3Dm
> CONFIG_USB_NET_QMI_WWAN=3Dm
> CONFIG_USB_HSO=3Dm
> CONFIG_USB_NET_INT51X1=3Dm
> CONFIG_USB_CDC_PHONET=3Dm
> CONFIG_USB_IPHETH=3Dm
> CONFIG_USB_SIERRA_NET=3Dm
> CONFIG_USB_VL600=3Dm
> CONFIG_ATH6KL_USB=3Dm
> CONFIG_AT76C50X_USB=3Dm
> CONFIG_BRCMFMAC_USB=3Dy
> CONFIG_P54_USB=3Dm
> CONFIG_LIBERTAS_USB=3Dm
> CONFIG_LIBERTAS_THINFIRM_USB=3Dm
> CONFIG_RT2500USB=3Dm
> CONFIG_RT73USB=3Dm
> CONFIG_RT2800USB=3Dm
> CONFIG_RT2800USB_RT33XX=3Dy
> CONFIG_RT2800USB_RT35XX=3Dy
> CONFIG_RT2800USB_RT3573=3Dy
> CONFIG_RT2800USB_RT53XX=3Dy
> CONFIG_RT2800USB_RT55XX=3Dy
> CONFIG_RT2X00_LIB_USB=3Dm
> CONFIG_RTLWIFI_USB=3Dm
> CONFIG_RSI_USB=3Dm
> CONFIG_USB_NET_RNDIS_WLAN=3Dm
> CONFIG_WIMAX_I2400M_USB=3Dm
> CONFIG_MOUSE_SYNAPTICS_USB=3Dm
> CONFIG_TABLET_USB_ACECAD=3Dm
> CONFIG_TABLET_USB_AIPTEK=3Dm
> CONFIG_TABLET_USB_GTCO=3Dm
> CONFIG_TABLET_USB_HANWANG=3Dm
> CONFIG_TABLET_USB_KBTAB=3Dm
> CONFIG_TOUCHSCREEN_USB_COMPOSITE=3Dm
> CONFIG_TOUCHSCREEN_USB_EGALAX=3Dy
> CONFIG_TOUCHSCREEN_USB_PANJIT=3Dy
> CONFIG_TOUCHSCREEN_USB_3M=3Dy
> CONFIG_TOUCHSCREEN_USB_ITM=3Dy
> CONFIG_TOUCHSCREEN_USB_ETURBO=3Dy
> CONFIG_TOUCHSCREEN_USB_GUNZE=3Dy
> CONFIG_TOUCHSCREEN_USB_DMC_TSC10=3Dy
> CONFIG_TOUCHSCREEN_USB_IRTOUCH=3Dy
> CONFIG_TOUCHSCREEN_USB_IDEALTEK=3Dy
> CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH=3Dy
> CONFIG_TOUCHSCREEN_USB_GOTOP=3Dy
> CONFIG_TOUCHSCREEN_USB_JASTEC=3Dy
> CONFIG_TOUCHSCREEN_USB_ELO=3Dy
> CONFIG_TOUCHSCREEN_USB_E2I=3Dy
> CONFIG_TOUCHSCREEN_USB_ZYTRONIC=3Dy
> CONFIG_TOUCHSCREEN_USB_ETT_TC45USB=3Dy
> CONFIG_TOUCHSCREEN_USB_NEXIO=3Dy
> CONFIG_TOUCHSCREEN_USB_EASYTOUCH=3Dy
> CONFIG_I2C_TINY_USB=3Dm
> CONFIG_MFD_RTSX_USB=3Dm
> CONFIG_IR_MCEUSB=3Dm
> CONFIG_IR_IGORPLUGUSB=3Dm
> CONFIG_IR_TTUSBIR=3Dm
> CONFIG_MEDIA_USB_SUPPORT=3Dy
> CONFIG_USB_VIDEO_CLASS=3Dm
> CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=3Dy
> CONFIG_USB_GSPCA=3Dm
> CONFIG_USB_M5602=3Dm
> CONFIG_USB_STV06XX=3Dm
> CONFIG_USB_GL860=3Dm
> CONFIG_USB_GSPCA_BENQ=3Dm
> CONFIG_USB_GSPCA_CONEX=3Dm
> CONFIG_USB_GSPCA_CPIA1=3Dm
> CONFIG_USB_GSPCA_DTCS033=3Dm
> CONFIG_USB_GSPCA_ETOMS=3Dm
> CONFIG_USB_GSPCA_FINEPIX=3Dm
> CONFIG_USB_GSPCA_JEILINJ=3Dm
> CONFIG_USB_GSPCA_JL2005BCD=3Dm
> CONFIG_USB_GSPCA_KINECT=3Dm
> CONFIG_USB_GSPCA_KONICA=3Dm
> CONFIG_USB_GSPCA_MARS=3Dm
> CONFIG_USB_GSPCA_MR97310A=3Dm
> CONFIG_USB_GSPCA_NW80X=3Dm
> CONFIG_USB_GSPCA_OV519=3Dm
> CONFIG_USB_GSPCA_OV534=3Dm
> CONFIG_USB_GSPCA_OV534_9=3Dm
> CONFIG_USB_GSPCA_PAC207=3Dm
> CONFIG_USB_GSPCA_PAC7302=3Dm
> CONFIG_USB_GSPCA_PAC7311=3Dm
> CONFIG_USB_GSPCA_SE401=3Dm
> CONFIG_USB_GSPCA_SN9C2028=3Dm
> CONFIG_USB_GSPCA_SN9C20X=3Dm
> CONFIG_USB_GSPCA_SONIXB=3Dm
> CONFIG_USB_GSPCA_SONIXJ=3Dm
> CONFIG_USB_GSPCA_SPCA500=3Dm
> CONFIG_USB_GSPCA_SPCA501=3Dm
> CONFIG_USB_GSPCA_SPCA505=3Dm
> CONFIG_USB_GSPCA_SPCA506=3Dm
> CONFIG_USB_GSPCA_SPCA508=3Dm
> CONFIG_USB_GSPCA_SPCA561=3Dm
> CONFIG_USB_GSPCA_SPCA1528=3Dm
> CONFIG_USB_GSPCA_SQ905=3Dm
> CONFIG_USB_GSPCA_SQ905C=3Dm
> CONFIG_USB_GSPCA_SQ930X=3Dm
> CONFIG_USB_GSPCA_STK014=3Dm
> CONFIG_USB_GSPCA_STK1135=3Dm
> CONFIG_USB_GSPCA_STV0680=3Dm
> CONFIG_USB_GSPCA_SUNPLUS=3Dm
> CONFIG_USB_GSPCA_T613=3Dm
> CONFIG_USB_GSPCA_TOPRO=3Dm
> CONFIG_USB_GSPCA_TV8532=3Dm
> CONFIG_USB_GSPCA_VC032X=3Dm
> CONFIG_USB_GSPCA_VICAM=3Dm
> CONFIG_USB_GSPCA_XIRLINK_CIT=3Dm
> CONFIG_USB_GSPCA_ZC3XX=3Dm
> CONFIG_USB_PWC=3Dm
> CONFIG_USB_PWC_INPUT_EVDEV=3Dy
> CONFIG_USB_ZR364XX=3Dm
> CONFIG_USB_STKWEBCAM=3Dm
> CONFIG_USB_S2255=3Dm
> CONFIG_VIDEO_USBTV=3Dm
> CONFIG_VIDEO_PVRUSB2=3Dm
> CONFIG_VIDEO_PVRUSB2_SYSFS=3Dy
> CONFIG_VIDEO_PVRUSB2_DVB=3Dy
> CONFIG_VIDEO_USBVISION=3Dm
> CONFIG_DVB_USB=3Dm
> CONFIG_DVB_USB_A800=3Dm
> CONFIG_DVB_USB_DIBUSB_MB=3Dm
> CONFIG_DVB_USB_DIBUSB_MB_FAULTY=3Dy
> CONFIG_DVB_USB_DIBUSB_MC=3Dm
> CONFIG_DVB_USB_DIB0700=3Dm
> CONFIG_DVB_USB_UMT_010=3Dm
> CONFIG_DVB_USB_CXUSB=3Dm
> CONFIG_DVB_USB_M920X=3Dm
> CONFIG_DVB_USB_DIGITV=3Dm
> CONFIG_DVB_USB_VP7045=3Dm
> CONFIG_DVB_USB_VP702X=3Dm
> CONFIG_DVB_USB_GP8PSK=3Dm
> CONFIG_DVB_USB_NOVA_T_USB2=3Dm
> CONFIG_DVB_USB_TTUSB2=3Dm
> CONFIG_DVB_USB_DTT200U=3Dm
> CONFIG_DVB_USB_OPERA1=3Dm
> CONFIG_DVB_USB_AF9005=3Dm
> CONFIG_DVB_USB_AF9005_REMOTE=3Dm
> CONFIG_DVB_USB_PCTV452E=3Dm
> CONFIG_DVB_USB_DW2102=3Dm
> CONFIG_DVB_USB_CINERGY_T2=3Dm
> CONFIG_DVB_USB_DTV5100=3Dm
> CONFIG_DVB_USB_FRIIO=3Dm
> CONFIG_DVB_USB_AZ6027=3Dm
> CONFIG_DVB_USB_TECHNISAT_USB2=3Dm
> CONFIG_DVB_USB_V2=3Dm
> CONFIG_DVB_USB_AF9015=3Dm
> CONFIG_DVB_USB_AF9035=3Dm
> CONFIG_DVB_USB_ANYSEE=3Dm
> CONFIG_DVB_USB_AU6610=3Dm
> CONFIG_DVB_USB_AZ6007=3Dm
> CONFIG_DVB_USB_CE6230=3Dm
> CONFIG_DVB_USB_EC168=3Dm
> CONFIG_DVB_USB_GL861=3Dm
> CONFIG_DVB_USB_LME2510=3Dm
> CONFIG_DVB_USB_MXL111SF=3Dm
> CONFIG_DVB_USB_RTL28XXU=3Dm
> CONFIG_DVB_USB_DVBSKY=3Dm
> CONFIG_SMS_USB_DRV=3Dm
> CONFIG_DVB_B2C2_FLEXCOP_USB=3Dm
> CONFIG_USB_AIRSPY=3Dm
> CONFIG_USB_HACKRF=3Dm
> CONFIG_USB_MSI2500=3Dm
> CONFIG_USB_SI470X=3Dm
> CONFIG_USB_MR800=3Dm
> CONFIG_USB_KEENE=3Dm
> CONFIG_USB_RAREMONO=3Dm
> CONFIG_USB_MA901=3Dm
> CONFIG_SND_USB=3Dy
> CONFIG_SND_USB_AUDIO=3Dm
> CONFIG_SND_USB_UA101=3Dm
> CONFIG_SND_USB_CAIAQ=3Dm
> CONFIG_SND_USB_CAIAQ_INPUT=3Dy
> CONFIG_SND_USB_6FIRE=3Dm
> CONFIG_SND_USB_HIFACE=3Dm
> CONFIG_SND_USB_LINE6=3Dm
> CONFIG_SND_USB_POD=3Dm
> CONFIG_SND_USB_PODHD=3Dm
> CONFIG_SND_USB_TONEPORT=3Dm
> CONFIG_SND_USB_VARIAX=3Dm
> CONFIG_USB_HID=3Dy
> CONFIG_USB_HIDDEV=3Dy
> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_COMMON=3Dy
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> CONFIG_USB=3Dy
> CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
> CONFIG_USB_DEFAULT_PERSIST=3Dy
> CONFIG_USB_DYNAMIC_MINORS=3Dy
> CONFIG_USB_MON=3Dy
> CONFIG_USB_WUSB_CBAF=3Dm
> CONFIG_USB_XHCI_HCD=3Dm
> CONFIG_USB_XHCI_PLATFORM=3Dm
> CONFIG_USB_EHCI_HCD=3Dm
> CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
> CONFIG_USB_EHCI_EXYNOS=3Dm
> CONFIG_USB_EHCI_HCD_PLATFORM=3Dm
> CONFIG_USB_OHCI_HCD=3Dm
> CONFIG_USB_OHCI_EXYNOS=3Dm
> CONFIG_USB_OHCI_HCD_PLATFORM=3Dm
> CONFIG_USB_ACM=3Dm
> CONFIG_USB_PRINTER=3Dm
> CONFIG_USB_WDM=3Dm
> CONFIG_USB_TMC=3Dm
> CONFIG_USB_STORAGE=3Dy
> CONFIG_USB_STORAGE_REALTEK=3Dm
> CONFIG_USB_STORAGE_DATAFAB=3Dm
> CONFIG_USB_STORAGE_FREECOM=3Dm
> CONFIG_USB_STORAGE_ISD200=3Dm
> CONFIG_USB_STORAGE_USBAT=3Dm
> CONFIG_USB_STORAGE_SDDR09=3Dm
> CONFIG_USB_STORAGE_SDDR55=3Dm
> CONFIG_USB_STORAGE_JUMPSHOT=3Dm
> CONFIG_USB_STORAGE_ALAUDA=3Dm
> CONFIG_USB_STORAGE_ONETOUCH=3Dm
> CONFIG_USB_STORAGE_KARMA=3Dm
> CONFIG_USB_STORAGE_CYPRESS_ATACB=3Dm
> CONFIG_USB_STORAGE_ENE_UB6250=3Dm
> CONFIG_USB_UAS=3Dm
> CONFIG_USB_MDC800=3Dm
> CONFIG_USB_MICROTEK=3Dm
> CONFIG_USB_DWC3=3Dm
> CONFIG_USB_DWC3_HOST=3Dy
> CONFIG_USB_DWC3_EXYNOS=3Dm
> CONFIG_USB_DWC3_OF_SIMPLE=3Dm
> CONFIG_USB_DWC2=3Dm
> CONFIG_USB_DWC2_HOST=3Dy
> CONFIG_USB_CHIPIDEA=3Dm
> CONFIG_USB_CHIPIDEA_OF=3Dm
> CONFIG_USB_CHIPIDEA_UDC=3Dy
> CONFIG_USB_SERIAL=3Dm
> CONFIG_USB_SERIAL_GENERIC=3Dy
> CONFIG_USB_SERIAL_SIMPLE=3Dm
> CONFIG_USB_SERIAL_AIRCABLE=3Dm
> CONFIG_USB_SERIAL_ARK3116=3Dm
> CONFIG_USB_SERIAL_BELKIN=3Dm
> CONFIG_USB_SERIAL_CH341=3Dm
> CONFIG_USB_SERIAL_WHITEHEAT=3Dm
> CONFIG_USB_SERIAL_DIGI_ACCELEPORT=3Dm
> CONFIG_USB_SERIAL_CP210X=3Dm
> CONFIG_USB_SERIAL_CYPRESS_M8=3Dm
> CONFIG_USB_SERIAL_EMPEG=3Dm
> CONFIG_USB_SERIAL_FTDI_SIO=3Dm
> CONFIG_USB_SERIAL_VISOR=3Dm
> CONFIG_USB_SERIAL_IPAQ=3Dm
> CONFIG_USB_SERIAL_IR=3Dm
> CONFIG_USB_SERIAL_EDGEPORT=3Dm
> CONFIG_USB_SERIAL_EDGEPORT_TI=3Dm
> CONFIG_USB_SERIAL_F81232=3Dm
> CONFIG_USB_SERIAL_GARMIN=3Dm
> CONFIG_USB_SERIAL_IPW=3Dm
> CONFIG_USB_SERIAL_IUU=3Dm
> CONFIG_USB_SERIAL_KEYSPAN_PDA=3Dm
> CONFIG_USB_SERIAL_KEYSPAN=3Dm
> CONFIG_USB_SERIAL_KLSI=3Dm
> CONFIG_USB_SERIAL_KOBIL_SCT=3Dm
> CONFIG_USB_SERIAL_MCT_U232=3Dm
> CONFIG_USB_SERIAL_METRO=3Dm
> CONFIG_USB_SERIAL_MOS7720=3Dm
> CONFIG_USB_SERIAL_MOS7840=3Dm
> CONFIG_USB_SERIAL_MXUPORT=3Dm
> CONFIG_USB_SERIAL_NAVMAN=3Dm
> CONFIG_USB_SERIAL_PL2303=3Dm
> CONFIG_USB_SERIAL_OTI6858=3Dm
> CONFIG_USB_SERIAL_QCAUX=3Dm
> CONFIG_USB_SERIAL_QUALCOMM=3Dm
> CONFIG_USB_SERIAL_SPCP8X5=3Dm
> CONFIG_USB_SERIAL_SAFE=3Dm
> CONFIG_USB_SERIAL_SIERRAWIRELESS=3Dm
> CONFIG_USB_SERIAL_SYMBOL=3Dm
> CONFIG_USB_SERIAL_TI=3Dm
> CONFIG_USB_SERIAL_CYBERJACK=3Dm
> CONFIG_USB_SERIAL_XIRCOM=3Dm
> CONFIG_USB_SERIAL_WWAN=3Dm
> CONFIG_USB_SERIAL_OPTION=3Dm
> CONFIG_USB_SERIAL_OMNINET=3Dm
> CONFIG_USB_SERIAL_OPTICON=3Dm
> CONFIG_USB_SERIAL_XSENS_MT=3Dm
> CONFIG_USB_SERIAL_WISHBONE=3Dm
> CONFIG_USB_SERIAL_SSU100=3Dm
> CONFIG_USB_SERIAL_QT2=3Dm
> CONFIG_USB_SERIAL_DEBUG=3Dm
> CONFIG_USB_EMI62=3Dm
> CONFIG_USB_EMI26=3Dm
> CONFIG_USB_ADUTUX=3Dm
> CONFIG_USB_SEVSEG=3Dm
> CONFIG_USB_RIO500=3Dm
> CONFIG_USB_LEGOTOWER=3Dm
> CONFIG_USB_LCD=3Dm
> CONFIG_USB_LED=3Dm
> CONFIG_USB_CYPRESS_CY7C63=3Dm
> CONFIG_USB_CYTHERM=3Dm
> CONFIG_USB_IDMOUSE=3Dm
> CONFIG_USB_FTDI_ELAN=3Dm
> CONFIG_USB_APPLEDISPLAY=3Dm
> CONFIG_USB_LD=3Dm
> CONFIG_USB_TRANCEVIBRATOR=3Dm
> CONFIG_USB_IOWARRIOR=3Dm
> CONFIG_USB_TEST=3Dm
> CONFIG_USB_EHSET_TEST_FIXTURE=3Dm
> CONFIG_USB_ISIGHTFW=3Dm
> CONFIG_USB_YUREX=3Dm
> CONFIG_USB_EZUSB_FX2=3Dm
> CONFIG_USB_HSIC_USB3503=3Dm
> CONFIG_USB_PHY=3Dy
> CONFIG_NOP_USB_XCEIV=3Dy
> CONFIG_AM335X_CONTROL_USB=3Dm
> CONFIG_AM335X_PHY_USB=3Dm
> CONFIG_USB_GPIO_VBUS=3Dm
> CONFIG_USB_ULPI=3Dy
> CONFIG_USB_ULPI_VIEWPORT=3Dy
> CONFIG_USB_GADGET=3Dy
> CONFIG_USB_LIBCOMPOSITE=3Dm
> CONFIG_USB_F_ACM=3Dm
> CONFIG_USB_U_SERIAL=3Dm
> CONFIG_USB_U_ETHER=3Dm
> CONFIG_USB_F_OBEX=3Dm
> CONFIG_USB_F_ECM=3Dm
> CONFIG_USB_F_PHONET=3Dm
> CONFIG_USB_F_SUBSET=3Dm
> CONFIG_USB_F_RNDIS=3Dm
> CONFIG_USB_F_MASS_STORAGE=3Dm
> CONFIG_USB_ETH=3Dm
> CONFIG_USB_ETH_RNDIS=3Dy
> CONFIG_USB_GADGETFS=3Dm
> CONFIG_USB_G_NOKIA=3Dm
> CONFIG_USB_LED_TRIG=3Dy
> CONFIG_MMC_REALTEK_USB=3Dm
> CONFIG_MEMSTICK_REALTEK_USB=3Dm
> CONFIG_PHY_SAMSUNG_USB2=3Dm
> CONFIG_PHY_EXYNOS5250_USB2=3Dy
> CONFIG_PHY_EXYNOS5_USBDRD=3Dm
>
> [5.] Most recent kernel version which did not have the bug:
> I did not test any other versions.
>
> [6.] Output of Oops:
> -
>
> [7.] A small shell script or example program which triggers the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0problem (if possible)
> -
>
> [8.] Environment
> [8.1.] Software (add the output of the ver_linux script here)
> Linux c0xu4 4.7.2+ #1 SMP Sun Aug 28 18:52:25 CEST 2016 armv7l
> GNU/Linux
> =C2=A0
> GNU C			4.9.2
> GNU Make		4.0
> Binutils		2.25
> Util-linux		2.25.2
> Mount			2.25.2
> Module-init-tools	18
> E2fsprogs		1.42.12
> Linux C Library		2.19
> Dynamic linker (ldd)	2.19
> Linux C++ Library	6.0.20
> Procps			3.3.9
> Net-tools		1.60
> Kbd			1.15.5
> Console-tools		1.15.5
> Sh-utils		8.23
> Udev			215
> Modules Loaded		autofs4 cdc_ether dwc3 dwc3_exynos
> ehci_exynos ehci_hcd evdev hid_generic ip6table_filter ip6_tables
> iptable_filter iptable_mangle iptable_nat ip_tables ipt_REJECT mii
> nf_conntrack nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat nf_nat_ipv4
> nf_reject_ipv4 ohci_exynos ohci_hcd phy_exynos5_usbdrd phy_exynos_usb2
> r8152 s5p_sss snd snd_hwdep snd_pcm snd_rawmidi snd_seq_device
> snd_timer snd_usb_audio snd_usbmidi_lib soundcore tun usbnet xhci_hcd
> xhci_plat_hcd x_tables xt_conntrack xt_multiport xt_tcpudp
>
> [8.2.] Processor information (from /proc/cpuinfo):
> processor	: 0
> vendor_id	: GenuineIntel
> cpu family	: 6
> model		: 78
> model name	: Intel(R) Core(TM) i5-6200U CPU @ 2.30GHz
> stepping	: 3
> microcode	: 0x8a
> cpu MHz		: 2739.111
> cache size	: 3072 KB
> physical id	: 0
> siblings	: 4
> core id		: 0
> cpu cores	: 2
> apicid		: 0
> initial apicid	: 0
> fpu		: yes
> fpu_exception	: yes
> cpuid level	: 22
> wp		: yes
> flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr
> pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
> syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
> rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq
> dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid
> sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c
> rdrand lahf_lm abm 3dnowprefetch epb intel_pt tpr_shadow vnmi
> flexpriority ept vpid fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms
> invpcid mpx rdseed adx smap clflushopt xsaveopt xsavec xgetbv1 dtherm
> ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp
> bugs		:
> bogomips	: 4801.87
> clflush size	: 64
> cache_alignment	: 64
> address sizes	: 39 bits physical, 48 bits virtual
> power management:
>
> processor	: 1
> vendor_id	: GenuineIntel
> cpu family	: 6
> model		: 78
> model name	: Intel(R) Core(TM) i5-6200U CPU @ 2.30GHz
> stepping	: 3
> microcode	: 0x8a
> cpu MHz		: 2618.701
> cache size	: 3072 KB
> physical id	: 0
> siblings	: 4
> core id		: 1
> cpu cores	: 2
> apicid		: 2
> initial apicid	: 2
> fpu		: yes
> fpu_exception	: yes
> cpuid level	: 22
> wp		: yes
> flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr
> pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
> syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
> rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq
> dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid
> sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c
> rdrand lahf_lm abm 3dnowprefetch epb intel_pt tpr_shadow vnmi
> flexpriority ept vpid fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms
> invpcid mpx rdseed adx smap clflushopt xsaveopt xsavec xgetbv1 dtherm
> ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp
> bugs		:
> bogomips	: 4802.09
> clflush size	: 64
> cache_alignment	: 64
> address sizes	: 39 bits physical, 48 bits virtual
> power management:
>
> processor	: 2
> vendor_id	: GenuineIntel
> cpu family	: 6
> model		: 78
> model name	: Intel(R) Core(TM) i5-6200U CPU @ 2.30GHz
> stepping	: 3
> microcode	: 0x8a
> cpu MHz		: 2765.917
> cache size	: 3072 KB
> physical id	: 0
> siblings	: 4
> core id		: 0
> cpu cores	: 2
> apicid		: 1
> initial apicid	: 1
> fpu		: yes
> fpu_exception	: yes
> cpuid level	: 22
> wp		: yes
> flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr
> pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
> syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
> rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq
> dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid
> sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c
> rdrand lahf_lm abm 3dnowprefetch epb intel_pt tpr_shadow vnmi
> flexpriority ept vpid fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms
> invpcid mpx rdseed adx smap clflushopt xsaveopt xsavec xgetbv1 dtherm
> ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp
> bugs		:
> bogomips	: 4803.65
> clflush size	: 64
> cache_alignment	: 64
> address sizes	: 39 bits physical, 48 bits virtual
> power management:
>
> processor	: 3
> vendor_id	: GenuineIntel
> cpu family	: 6
> model		: 78
> model name	: Intel(R) Core(TM) i5-6200U CPU @ 2.30GHz
> stepping	: 3
> microcode	: 0x8a
> cpu MHz		: 2757.421
> cache size	: 3072 KB
> physical id	: 0
> siblings	: 4
> core id		: 1
> cpu cores	: 2
> apicid		: 3
> initial apicid	: 3
> fpu		: yes
> fpu_exception	: yes
> cpuid level	: 22
> wp		: yes
> flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr
> pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
> syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
> rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq
> dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid
> sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c
> rdrand lahf_lm abm 3dnowprefetch epb intel_pt tpr_shadow vnmi
> flexpriority ept vpid fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms
> invpcid mpx rdseed adx smap clflushopt xsaveopt xsavec xgetbv1 dtherm
> ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp
> bugs		:
> bogomips	: 4803.17
> clflush size	: 64
> cache_alignment	: 64
> address sizes	: 39 bits physical, 48 bits virtual
> power management:
>
>
> [8.3.] Module information (from /proc/modules):
> mmc_block 40960 0 - Live 0xffffffffc0cb3000
> xfrm_user 32768 1 - Live 0xffffffffc0caa000
> xfrm_algo 16384 1 xfrm_user, Live 0xffffffffc0c5c000
> xt_addrtype 16384 2 - Live 0xffffffffc0c46000
> br_netfilter 24576 0 - Live 0xffffffffc0c7a000
> fuse 98304 2 - Live 0xffffffffc0c91000
> dm_thin_pool 61440 1 - Live 0xffffffffc0c81000
> dm_persistent_data 57344 1 dm_thin_pool, Live 0xffffffffc0c6b000
> dm_bio_prison 16384 1 dm_thin_pool, Live 0xffffffffc0c62000
> dm_bufio 24576 1 dm_persistent_data, Live 0xffffffffc0c55000
> libcrc32c 16384 1 dm_persistent_data, Live 0xffffffffc0c50000
> crc32c_generic 16384 0 - Live 0xffffffffc0c4b000
> loop 28672 4 - Live 0xffffffffc0c3e000
> xt_CHECKSUM 16384 1 - Live 0xffffffffc0bf3000
> iptable_mangle 16384 1 - Live 0xffffffffc0c39000
> ipt_MASQUERADE 16384 4 - Live 0xffffffffc0c34000
> nf_nat_masquerade_ipv4 16384 1 ipt_MASQUERADE, Live 0xffffffffc0c2f000
> iptable_nat 16384 1 - Live 0xffffffffc0c2a000
> nf_nat_ipv4 16384 1 iptable_nat, Live 0xffffffffc07ef000
> nf_nat 24576 2 nf_nat_masquerade_ipv4,nf_nat_ipv4, Live
> 0xffffffffc0bec000
> ipt_REJECT 16384 2 - Live 0xffffffffc07e1000
> nf_reject_ipv4 16384 1 ipt_REJECT, Live 0xffffffffc07dc000
> xt_tcpudp 16384 6 - Live 0xffffffffc0be7000
> tun 28672 1 - Live 0xffffffffc07e7000
> bridge 122880 1 br_netfilter, Live 0xffffffffc0c0b000
> stp 16384 1 bridge, Live 0xffffffffc07d7000
> llc 16384 2 bridge,stp, Live 0xffffffffc07ce000
> ebtable_filter 16384 0 - Live 0xffffffffc07c9000
> ebtables 32768 1 ebtable_filter, Live 0xffffffffc07bc000
> ip6_tables 28672 0 - Live 0xffffffffc09cf000
> snd_hda_codec_hdmi 45056 1 - Live 0xffffffffc0aee000
> snd_hda_codec_realtek 69632 1 - Live 0xffffffffc0bf9000
> snd_hda_codec_generic 69632 1 snd_hda_codec_realtek, Live
> 0xffffffffc0ba7000
> nf_conntrack_ipv4 16384 4 - Live 0xffffffffc09a1000
> nf_defrag_ipv4 16384 1 nf_conntrack_ipv4, Live 0xffffffffc091f000
> xt_conntrack 16384 3 - Live 0xffffffffc062f000
> nf_conntrack 90112 5
> nf_nat_masquerade_ipv4,nf_nat_ipv4,nf_nat,nf_conntrack_ipv4,xt_conntrac
> k, Live 0xffffffffc0bd0000
> iptable_filter 16384 1 - Live 0xffffffffc04cb000
> rc_su3000 16384 0 - Live 0xffffffffc0bcb000
> snd_soc_skl 57344 0 - Live 0xffffffffc0bbc000
> snd_soc_skl_ipc 32768 1 snd_soc_skl, Live 0xffffffffc097c000
> snd_soc_sst_ipc 16384 1 snd_soc_skl_ipc, Live 0xffffffffc0977000
> snd_soc_sst_dsp 36864 1 snd_soc_skl_ipc, Live 0xffffffffc09a6000
> snd_hda_ext_core 20480 1 snd_soc_skl, Live 0xffffffffc093b000
> snd_soc_sst_match 16384 1 snd_soc_skl, Live 0xffffffffc0936000
> snd_soc_core 180224 1 snd_soc_skl, Live 0xffffffffc0b7a000
> snd_compress 20480 1 snd_soc_core, Live 0xffffffffc0919000
> snd_pcm_dmaengine 16384 1 snd_soc_core, Live 0xffffffffc0665000
> ac97_bus 16384 1 snd_soc_core, Live 0xffffffffc0660000
> dw_dmac_core 24576 1 snd_soc_sst_dsp, Live 0xffffffffc0540000
> ts2020 20480 1 - Live 0xffffffffc04f3000
> ds3000 20480 1 - Live 0xffffffffc0514000
> nls_iso8859_1 16384 1 - Live 0xffffffffc04e9000
> nls_cp437 20480 1 - Live 0xffffffffc0508000
> vfat 20480 1 - Live 0xffffffffc0502000
> fat 65536 1 vfat, Live 0xffffffffc08c9000
> arc4 16384 2 - Live 0xffffffffc055b000
> iTCO_wdt 16384 0 - Live 0xffffffffc0529000
> intel_rapl 20480 0 - Live 0xffffffffc04d2000
> iTCO_vendor_support 16384 1 iTCO_wdt, Live 0xffffffffc067a000
> x86_pkg_temp_thermal 16384 0 - Live 0xffffffffc04ee000
> intel_powerclamp 16384 0 - Live 0xffffffffc050f000
> coretemp 16384 0 - Live 0xffffffffc02f4000
> mousedev 20480 0 - Live 0xffffffffc04bb000
> kvm_intel 184320 0 - Live 0xffffffffc0a7c000
> kvm 507904 1 kvm_intel, Live 0xffffffffc0afd000
> irqbypass 16384 1 kvm, Live 0xffffffffc063e000
> iwlmvm 266240 0 - Live 0xffffffffc0aac000
> mac80211 659456 1 iwlmvm, Live 0xffffffffc09da000
> pcspkr 16384 0 - Live 0xffffffffc062a000
> snd_hda_intel 32768 2 - Live 0xffffffffc05c1000
> psmouse 118784 0 - Live 0xffffffffc09b1000
> serio_raw 16384 0 - Live 0xffffffffc059c000
> snd_hda_codec 106496 4
> snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_
> intel, Live 0xffffffffc0986000
> e1000e 217088 0 - Live 0xffffffffc0941000
> snd_hda_core 65536 7
> snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_soc_
> skl,snd_hda_ext_core,snd_hda_intel,snd_hda_codec, Live
> 0xffffffffc0925000
> snd_hwdep 16384 1 snd_hda_codec, Live 0xffffffffc053b000
> snd_pcm 86016 8
> snd_hda_codec_hdmi,snd_soc_skl,snd_hda_ext_core,snd_soc_core,snd_pcm_dm
> aengine,snd_hda_intel,snd_hda_codec,snd_hda_core, Live
> 0xffffffffc0903000
> ptp 20480 1 e1000e, Live 0xffffffffc0531000
> snd_timer 28672 1 snd_pcm, Live 0xffffffffc04c3000
> pps_core 20480 1 ptp, Live 0xffffffffc08fd000
> i2c_i801 20480 0 - Live 0xffffffffc08f7000
> hid_generic 16384 0 - Live 0xffffffffc08f2000
> joydev 20480 0 - Live 0xffffffffc08e8000
> evdev 24576 16 - Live 0xffffffffc08dd000
> input_leds 16384 0 - Live 0xffffffffc0684000
> mac_hid 16384 0 - Live 0xffffffffc067f000
> dvb_usb_dw2102 65536 0 - Live 0xffffffffc0888000
> dvb_usb 24576 1 dvb_usb_dw2102, Live 0xffffffffc066a000
> dvb_core 106496 2 dvb_usb_dw2102,dvb_usb, Live 0xffffffffc086d000
> rc_core 24576 4 rc_su3000,dvb_usb_dw2102,dvb_usb, Live
> 0xffffffffc0623000
> iwlwifi 184320 1 iwlmvm, Live 0xffffffffc089b000
> cfg80211 491520 3 iwlmvm,mac80211,iwlwifi, Live 0xffffffffc07f4000
> rtsx_pci_ms 20480 0 - Live 0xffffffffc061d000
> i915 1236992 15 - Live 0xffffffffc068d000
> memstick 16384 1 rtsx_pci_ms, Live 0xffffffffc0614000
> shpchp 32768 0 - Live 0xffffffffc0671000
> drm_kms_helper 114688 1 i915, Live 0xffffffffc0643000
> mei_me 32768 0 - Live 0xffffffffc0635000
> drm 294912 9 i915,drm_kms_helper, Live 0xffffffffc05cb000
> mei 81920 1 mei_me, Live 0xffffffffc05ac000
> intel_pch_thermal 16384 0 - Live 0xffffffffc05a7000
> intel_gtt 20480 1 i915, Live 0xffffffffc05a1000
> syscopyarea 16384 1 drm_kms_helper, Live 0xffffffffc04e4000
> sysfillrect 16384 1 drm_kms_helper, Live 0xffffffffc0560000
> sysimgblt 16384 1 drm_kms_helper, Live 0xffffffffc0520000
> fb_sys_fops 16384 1 drm_kms_helper, Live 0xffffffffc04df000
> i2c_algo_bit 16384 1 i915, Live 0xffffffffc051b000
> thermal 20480 0 - Live 0xffffffffc0596000
> thinkpad_acpi 77824 1 - Live 0xffffffffc057e000
> wmi 16384 0 - Live 0xffffffffc04fd000
> nvram 16384 1 thinkpad_acpi, Live 0xffffffffc048b000
> snd 65536 15
> snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_soc_
> core,snd_compress,snd_hda_intel,snd_hda_codec,snd_hwdep,snd_pcm,snd_tim
> er,thinkpad_acpi, Live 0xffffffffc056d000
> soundcore 16384 1 snd, Live 0xffffffffc04b6000
> led_class 16384 3 iwlmvm,input_leds,thinkpad_acpi, Live
> 0xffffffffc04ad000
> rfkill 20480 3 cfg80211,thinkpad_acpi, Live 0xffffffffc04d9000
> ac 16384 0 - Live 0xffffffffc0565000
> video 36864 2 i915,thinkpad_acpi, Live 0xffffffffc0551000
> battery 20480 0 - Live 0xffffffffc054b000
> tpm_tis 20480 0 - Live 0xffffffffc0499000
> fjes 28672 0 - Live 0xffffffffc0491000
> button 16384 1 i915, Live 0xffffffffc02cf000
> tpm 36864 1 tpm_tis, Live 0xffffffffc0481000
> sch_fq_codel 20480 3 - Live 0xffffffffc04a7000
> vboxnetflt 28672 0 - Live 0xffffffffc049f000 (O)
> vboxnetadp 28672 0 - Live 0xffffffffc0398000 (O)
> pci_stub 16384 1 - Live 0xffffffffc026e000
> vboxpci 24576 0 - Live 0xffffffffc02de000 (O)
> vboxdrv 385024 3 vboxnetflt,vboxnetadp,vboxpci, Live 0xffffffffc0422000
> (O)
> ip_tables 24576 3 iptable_mangle,iptable_nat,iptable_filter, Live
> 0xffffffffc0323000
> x_tables 28672 11
> xt_addrtype,xt_CHECKSUM,iptable_mangle,ipt_MASQUERADE,ipt_REJECT,xt_tcp
> udp,ebtables,ip6_tables,xt_conntrack,iptable_filter,ip_tables, Live
> 0xffffffffc0313000
> ext4 516096 1 - Live 0xffffffffc03a3000
> crc16 16384 1 ext4, Live 0xffffffffc023a000
> jbd2 90112 1 ext4, Live 0xffffffffc02b0000
> mbcache 16384 2 ext4, Live 0xffffffffc0269000
> algif_skcipher 20480 0 - Live 0xffffffffc021f000
> af_alg 16384 1 algif_skcipher, Live 0xffffffffc0198000
> usbhid 45056 0 - Live 0xffffffffc038c000
> dm_crypt 28672 1 - Live 0xffffffffc01a4000
> dm_mod 102400 12 dm_thin_pool,dm_persistent_data,dm_bufio,dm_crypt,
> Live 0xffffffffc0372000
> sd_mod 36864 3 - Live 0xffffffffc01e5000
> rtsx_pci_sdmmc 24576 0 - Live 0xffffffffc01de000
> mmc_core 118784 2 mmc_block,rtsx_pci_sdmmc, Live 0xffffffffc0354000
> atkbd 24576 0 - Live 0xffffffffc019d000
> libps2 16384 2 psmouse,atkbd, Live 0xffffffffc02ef000
> crct10dif_pclmul 16384 0 - Live 0xffffffffc0303000
> crc32_pclmul 16384 0 - Live 0xffffffffc0226000
> crc32c_intel 24576 1 - Live 0xffffffffc031c000
> ghash_clmulni_intel 16384 0 - Live 0xffffffffc021a000
> aesni_intel 167936 3 - Live 0xffffffffc032a000
> aes_x86_64 20480 1 aesni_intel, Live 0xffffffffc030d000
> lrw 16384 1 aesni_intel, Live 0xffffffffc02fe000
> gf128mul 16384 1 lrw, Live 0xffffffffc0308000
> glue_helper 16384 1 aesni_intel, Live 0xffffffffc02f9000
> ablk_helper 16384 1 aesni_intel, Live 0xffffffffc0193000
> cryptd 20480 4 ghash_clmulni_intel,aesni_intel,ablk_helper, Live
> 0xffffffffc02e5000
> ahci 36864 2 - Live 0xffffffffc02d4000
> libahci 28672 1 ahci, Live 0xffffffffc02c7000
> libata 204800 2 ahci,libahci, Live 0xffffffffc027d000
> xhci_pci 16384 0 - Live 0xffffffffc0274000
> xhci_hcd 159744 1 xhci_pci, Live 0xffffffffc0241000
> rtsx_pci 45056 2 rtsx_pci_ms,rtsx_pci_sdmmc, Live 0xffffffffc022e000
> scsi_mod 155648 2 sd_mod,libata, Live 0xffffffffc01f3000
> usbcore 200704 5 dvb_usb_dw2102,dvb_usb,usbhid,xhci_pci,xhci_hcd, Live
> 0xffffffffc01ac000
> usb_common 16384 1 usbcore, Live 0xffffffffc018e000
> i8042 24576 1 libps2, Live 0xffffffffc017c000
> serio 20480 7 psmouse,serio_raw,atkbd,i8042, Live 0xffffffffc0188000
> hid_cherry 16384 0 - Live 0xffffffffc0183000
> hid 114688 3 hid_generic,usbhid,hid_cherry, Live 0xffffffffc015f000
> jitterentropy_rng 16384 0 - Live 0xffffffffc015a000
> sha256_ssse3 32768 1 - Live 0xffffffffc0151000
> sha256_generic 20480 1 sha256_ssse3, Live 0xffffffffc0148000
> hmac 16384 1 - Live 0xffffffffc0140000
> drbg 32768 1 - Live 0xffffffffc0133000
> ansi_cprng 16384 0 - Live 0xffffffffc012b000
>
> [8.4.] Loaded driver and hardware information (/proc/ioports,
> /proc/iomem)
> #ioports
> empty
>
> #iomem
> 02020000-02073fff : 2020000.sysram:
> 03810000-0381000b : /audss-clock-controller@3810000
> 03860000-03860fff : /pinctrl@03860000
> 03880000-03880fff : /amba/adma@03880000
> =C2=A0 03880000-03880fff : /amba/adma@03880000
> 10040000-10044fff : /system-controller@10040000
> 101e0000-101e00ff : /rtc@101E0000
> 10800000-10800fff : /amba/mdma@10800000
> =C2=A0 10800000-10800fff : /amba/mdma@10800000
> 10830000-108302ff : /sss@10830000
> 10a60000-10a60fff : /sysmmu@0x10A60000
> 10a70000-10a70fff : /sysmmu@0x10A70000
> 10ca1000-10ca11ff : /nocp@10CA1000
> 10ca1400-10ca15ff : /nocp@10CA1400
> 10ca1800-10ca19ff : /nocp@10CA1800
> 10ca1c00-10ca1dff : /nocp@10CA1C00
> 11200000-11200fff : /sysmmu@0x11200000
> 11210000-11210fff : /sysmmu@0x11210000
> 11c00000-11c00063 : /rotator@11C00000
> 11d40000-11d40fff : /sysmmu@0x11D40000
> 11f10000-11f10fff : /sysmmu@0x11F10000
> 11f20000-11f20fff : /sysmmu@0x11F20000
> 12000000-12007fff : /usb3-0/dwc3@12000000
> =C2=A0 12000000-12007fff : /usb3-0/dwc3@12000000
> 1200c100-1200ffff : /usb3-0/dwc3@12000000
> 12100000-121000ff : /phy@12100000
> 12110000-121100ff : /usb@12110000
> 12120000-121200ff : /usb@12120000
> 12130000-121300ff : /phy@12130000
> 121a0000-121a0fff : /amba/pdma@121A0000
> =C2=A0 121a0000-121a0fff : /amba/pdma@121A0000
> 121b0000-121b0fff : /amba/pdma@121B0000
> =C2=A0 121b0000-121b0fff : /amba/pdma@121B0000
> 12200000-12201fff : /mmc@12200000
> 12220000-12220fff : /mmc@12220000
> 12400000-12407fff : /usb3-1/dwc3@12400000
> =C2=A0 12400000-12407fff : /usb3-1/dwc3@12400000
> 1240c100-1240ffff : /usb3-1/dwc3@12400000
> 12500000-125000ff : /phy@12500000
> 12880000-12880fff : /sysmmu@0x12880000
> 12890000-12890fff : /sysmmu@0x12890000
> 128a0000-128a0fff : /sysmmu@0x128A0000
> 128c0000-128c0fff : /sysmmu@0x128C0000
> 128d0000-128d0fff : /sysmmu@0x128D0000
> 128e0000-128e0fff : /sysmmu@0x128E0000
> 12c00000-12c000ff : 12c00000.serial:
> 12c10000-12c100ff : 12c10000.serial:
> 12c20000-12c200ff : 12c20000.serial:
> 12c30000-12c300ff : 12c30000.serial:
> 12ca0000-12ca0fff : /i2c@12CA0000
> 12dd0000-12dd00ff : /pwm@12dd0000
> 13400000-13400fff : /pinctrl@13400000
> 13410000-13410fff : /pinctrl@13410000
> 13e00000-13e00fff : /video-scaler@13e00000
> 13e10000-13e10fff : /video-scaler@13e10000
> 13e80000-13e80fff : /sysmmu@0x13E80000
> 13e90000-13e90fff : /sysmmu@0x13E90000
> 14000000-14000fff : /pinctrl@14000000
> 14010000-14010fff : /pinctrl@14010000
> 14640000-14640fff : /sysmmu@0x14640000
> 14650000-14650fff : /sysmmu@0x14650000
> 14680000-14680fff : /sysmmu@0x14680000
> 40000000-42ffffff : System RAM
> =C2=A0 40008000-40ae61bb : Kernel code
> =C2=A0 40c00000-40cf10c3 : Kernel data
> 43800000-50ffffff : System RAM
> 51800000-be9fffff : System RAM
>
> [8.5.] PCI information ('lspci -vvv' as root)
> [8.6.] SCSI information (from /proc/scsi/scsi)
> [8.7.] Other information that might be relevant to the problem
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(please look in /proc and inclu=
de all information that you
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0think to be relevant):
>
> [9.] Other notes, patches, fixes, workarounds:
> [9.1] https://lkml.org/lkml/2014/4/28/234
> [9.2] https://lkml.org/lkml/2015/2/2/259
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJXw+QgAAoJEIaOsuA1yqREG/sQAJoROdfFXlaRWpK9KJgwbDJm
7AiEtzlmQ3plz02gYqK7V8NR2n35ZBfvr8/s1oSobmixuH7k5iFdB4TEcqMJgQKG
mJ2OnpK9Sag1e4LgoN1uPUlHK+KcXSNao9ArDnqsm5NDy7ZbZDStw85bmREbfp2u
EOA/H8VLz0MHQwSgIbdTFRdXAiFmnlzoNtfv6dKy9Nlj5ZfVgqq8wnOlZasuLmvz
BvSRr0Mayp4A/YvBr0+V7nnBcBS1io9tD4OV1jHX/CJY/bn9t2T916SG/jTVXIJ9
PUWE9NXXuQTSmRlaUP4zPaOy1gYrpcvNF6In/ztGUQxZyztbxYs2hsLlaSl7c2+g
1xHpo5rAIn9TaeV24ho9F34KS+Tfy/M+X8OLYz2SsN66PEkWMDfKD+uC12dozm+L
qPOeeLOKzPrN+wv2YApc/vT8tDryik8ANFvmW0eVfSSAbHa1vmASBCLCirRP9B+X
HIJUgpIvRTg9zobJD92Gh1czpq2QBWQ6PA9YmEESnxaXu+YXdsgxpyhFMERIL8Vx
+xpt4//IQT6sDPYoXPgeYXU6DP+cbJlnwwtwxnUWtKFQyDiSdaZ13uavUjuY4lmm
QEdUvJVuYG5RjPd6JENPNwmkxduM4M4343NaYEHcbbB4vTs0RurSKSfOS4m3Pist
HKJeG35msnVhMVVUubHI
=VcEy
-----END PGP SIGNATURE-----
--=-=-=--
